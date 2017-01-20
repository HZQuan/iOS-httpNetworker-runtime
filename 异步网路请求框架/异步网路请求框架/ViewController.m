//
//  ViewController.m
//  异步网路请求框架
//
//  Created by 黄增权 on 15/10/28.
//  Copyright © 2015年 黄增权. All rights reserved.
//

#import "ViewController.h"
#import "HttpNetWorkerManager.h"
#import "Message.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HttpNetWorkerManager *manager = [HttpNetWorkerManager manager];
//    NSDictionary *ditonaryParams =  [NSDictionary dictionaryWithObjectsAndKeys:@"huangzq",@"zhanghao",@"7563268",@"password",@"go",@"gogogo", nil];
//    Class class = NSClassFromString(@"Message");
//    id object = [[class alloc]init];
//    NSLog(@"%@",object);
//    
//    HttpRequest *request = [[HttpRequest alloc] initWithUrl:@"http://127.0.0.1:8080/SSH/message.jsp" params:ditonaryParams method:post modle:@"Message"];
//    [manager requestWithRequeter:request response:^(HttpResponse *response) {
//        NSMutableArray *mutableArray = (NSMutableArray *)response.responseModelArray;
//        NSLog(@"%lu",(unsigned long)mutableArray.count);
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
