//
//  HttpRequest.m
//  异步网路请求框架
//
//  Created by 黄增权 on 15/10/28.
//  Copyright © 2015年 黄增权. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest
-(instancetype)initWithUrl:(NSString *)requestUrl params:(NSDictionary *)params method:(Method)method modle:(NSString *)modleName
{
    self = [super init];
    if (self) {
        _requestUrl = requestUrl;
        _params = params;
        _method = method;
        _modleName = modleName;
    }
    return self;
}


@end
