//
//  Message.h
//  异步网路请求框架
//
//  Created by 黄增权 on 15/11/29.
//  Copyright (c) 2015年 黄增权. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
@property(nonatomic ,copy) NSString* content;
@property(nonatomic ,copy) NSString* message_id;
@property(nonatomic ,copy) NSString* time;
@property(nonatomic ,copy) NSString* user_id;

@end
