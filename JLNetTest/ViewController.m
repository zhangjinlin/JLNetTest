//
//  ViewController.m
//  JLNetTest
//
//  Created by job on 16/7/27.
//  Copyright © 2016年 job. All rights reserved.
//

#import "ViewController.h"
#import "RequestUtil.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [RequestUtil handleGetMethodWithHost:@"http://app.carjob.com.cn/"
                                urlSting:@"search/position"
                               parameter:@{@"pageNo":@(1),@"pageSize":@"20",@"myUserId":@"0"}
                                   block:^(NSDictionary *dict, NSError *error) {
                                       
                                       if (!error) {
                                           if ([dict[@"code"] intValue] == 200) {
                                               dict = dict[@"data"];
                                               
                                           }
                                       }else {
                                           
                                       }
                                       
                                       
                                       
                                   
                               }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
