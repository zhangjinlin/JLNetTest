//
//  NSObject+JLArchive.m
//  JLNetTest
//
//  Created by job on 16/8/23.
//  Copyright © 2016年 job. All rights reserved.
//

#import "NSObject+JLArchive.h"
#import <objc/runtime.h>
@implementation NSObject (JLArchive)

- (void)encode:(NSCoder *)aCoder
{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i++)
    {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([self.ignoredIvarNames containsObject:[key substringFromIndex:1]])
        {
            continue;
        }
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (void)decode:(NSCoder *)aDecoder
{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i++)
    {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([self.ignoredIvarNames containsObject:[key substringFromIndex:1]])
        {
            continue;
        }
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
    free(ivars);
}

- (void)setIgnoredIvarNames:(NSArray *)ignoredIvarNames
{
    objc_setAssociatedObject(self,
                             @selector(ignoredIvarNames),
                             ignoredIvarNames,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)ignoredIvarNames
{
    return objc_getAssociatedObject(self, _cmd);
}
@end
