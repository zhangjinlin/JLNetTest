//
//  Product.h
//  JLNetTest
//
//  Created by job on 16/8/22.
//  Copyright © 2016年 job. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+JLProperty.h"
@interface Product : NSObject
@property (strong, nonatomic) NSString *childCity;
@property (strong, nonatomic) NSDictionary *supName;

@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) NSString *cityEnName;
@property (strong, nonatomic) NSString *posId;
@property (strong, nonatomic) NSString *posName;
@property (strong, nonatomic) NSString *postDateLable;
@property (strong, nonatomic) NSString *reqWorkyearLabel;


@end
