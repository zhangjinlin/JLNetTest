//
//  RequestUtil.m
//  JLNetTest
//
//  Created by job on 16/7/27.
//  Copyright © 2016年 job. All rights reserved.
//

#import "RequestUtil.h"
#import <AFNetworking/AFNetworking.h>
@implementation RequestUtil

+(void)handleGetMethodWithHost:(NSString *)host
                      urlSting:(NSString *)url
                     parameter:(NSDictionary *)paraDict
                         block:(void (^)(NSDictionary *dict, NSError *error))block {

    AFHTTPSessionManager *manger  = [AFHTTPSessionManager manager];
    manger.responseSerializer     = [AFHTTPResponseSerializer serializer];
    manger.requestSerializer      = [AFJSONRequestSerializer serializer];
    
    [manger  GET:[NSString stringWithFormat:@"%@%@",host,url] parameters:paraDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"dict---%@",dict);
        if (block) {
            block(dict,nil);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block([NSDictionary dictionary], error);
        }
    }];
    
}
+(void)handlePostMethodWithHost:(NSString *)host
                       urlSting:(NSString *)url
                      parameter:(NSDictionary *)paraDict
                          block:(void (^)(NSDictionary *dict, NSError *error))block {
    AFHTTPSessionManager *manger  = [AFHTTPSessionManager manager];
    manger.responseSerializer     = [AFHTTPResponseSerializer serializer];
    manger.requestSerializer      = [AFJSONRequestSerializer serializer];
    
    [manger  POST:[NSString stringWithFormat:@"%@%@",host,url] parameters:paraDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"dict---%@",dict);
        if (block) {
            block(dict,nil);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block([NSDictionary dictionary], error);
        }
    }];
}




@end
