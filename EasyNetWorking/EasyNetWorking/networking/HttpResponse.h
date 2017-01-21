//
//  HttpResponse.h
//  异步网路请求框架
//
//  Created by 黄增权 on 15/10/28.
//  Copyright © 2015年 黄增权. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpResponse : NSObject
@property(nonatomic, strong) id responseData;
@property(nonatomic, copy) NSString *responseType;
@property(nonatomic, copy) NSString *modelClass;
@property(nonatomic, strong) id responseModle;
@property(nonatomic, strong) id responseModelArray;

-(instancetype) initWithData:(id)responseData type:(NSString *)type classname:(NSString *)className;

@end
