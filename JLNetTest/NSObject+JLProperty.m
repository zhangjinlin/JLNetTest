//
//  NSObject+JLProperty.m
//  JLNetTest
//
//  Created by job on 16/8/22.
//  Copyright © 2016年 job. All rights reserved.
//

#import "NSObject+JLProperty.h"
#import <objc/runtime.h>

@implementation NSObject (JLProperty)

+(instancetype)objectWithDictionary:(NSDictionary *)dictionary {
    id obj = [[self alloc]init];
    //获取所有的成员变量；
    unsigned int count;
    
    Ivar *ivars = class_copyIvarList(self, &count);
    for (unsigned int i= 0 ; i< count; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key      = [ivarName substringFromIndex:1];
        id value = dictionary[key];
        if ([value isKindOfClass:[NSNull class]]) {
            value = @"";
        }
        if (!value)
        {
            if ([self respondsToSelector:@selector(replaceKeyFromPropertyName)])
            {
                NSString *replaceKey = [self replaceKeyFromPropertyName][key];
                value = dictionary[replaceKey];
            }
        }
        
        // 字典嵌套字典
        if ([value isKindOfClass:[NSDictionary class]])
        {
            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            NSRange range = [type rangeOfString:@"\""];
            type  = [type substringFromIndex:range.location + range.length];
            range = [type rangeOfString:@"\""];
            type  = [type substringToIndex:range.location];
            Class modelClass = NSClassFromString(type);
            
            if (modelClass)
            {
                value = [modelClass objectWithDictionary:value];
            }
        }
        
        // 字典嵌套数组
        if ([value isKindOfClass:[NSArray class]])
        {
            if ([self respondsToSelector:@selector(objectClassInArray)])
            {
                NSMutableArray *models = [NSMutableArray array];
                
                NSString *type = [self objectClassInArray][key];
                Class classModel = NSClassFromString(type);
                for (NSDictionary *dict in value)
                {
                    id model = [classModel objectWithDictionary:dict];
                    [models addObject:model];
                }
                value = models;
            }
        }
        
        if (value)
        {
            [obj setValue:value forKey:key];
        }
    }
    
    // 释放ivars
    free(ivars);
 
    
    return obj;
}



@end
