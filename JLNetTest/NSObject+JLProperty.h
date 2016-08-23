//
//  NSObject+JLProperty.h
//  JLNetTest
//
//  Created by job on 16/8/22.
//  Copyright © 2016年 job. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JLKeyValue <NSObject>

@optional

/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 */
+(NSDictionary *)objectClassInArray;
/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+(NSDictionary *)replaceKeyFromPropertyName;


@end
@interface NSObject (JLProperty)<JLKeyValue>
+(instancetype)objectWithDictionary:(NSDictionary *)dictionary;
@end
