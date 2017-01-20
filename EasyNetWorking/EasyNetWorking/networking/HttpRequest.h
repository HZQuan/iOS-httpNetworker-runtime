//
//  HttpRequest.h
//  异步网路请求框架
//
//  Created by 黄增权 on 15/10/28.
//  Copyright © 2015年 黄增权. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    get,
    post,
    put,
    delet,
}Method;

@interface HttpRequest : NSObject
@property(nonatomic,copy) NSString *requestUrl;
@property(nonatomic,strong) NSDictionary *params;
@property(nonatomic,copy) NSString *acceptType;
@property(nonatomic ,assign) Method method;
@property(nonatomic ,copy) NSString *modleName;

-(instancetype) initWithUrl:(NSString *)requestUrl params:(NSDictionary *)params method:(Method) method modle:(NSString*)modleName;



@end

