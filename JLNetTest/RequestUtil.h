//
//  RequestUtil.h
//  JLNetTest
//
//  Created by job on 16/7/27.
//  Copyright © 2016年 job. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestUtil : NSObject

/**
 *  get方法
 *
 *  @param host     域名
 *  @param url      连接
 *  @param paraDict 参数
 *  @param block    返回block
 */
+(void)handleGetMethodWithHost:(NSString *)host
                      urlSting:(NSString *)url
                     parameter:(NSDictionary *)paraDict
                         block:(void (^)(NSDictionary *dict, NSError *error))block;


/**
 *  post方法
 *
 *  @param host     域名
 *  @param url      连接
 *  @param paraDict 参数
 *  @param block    返回block
 */
+(void)handlePostMethodWithHost:(NSString *)host
                      urlSting:(NSString *)url
                     parameter:(NSDictionary *)paraDict
                         block:(void (^)(NSDictionary *dict, NSError *error))block;





@end
