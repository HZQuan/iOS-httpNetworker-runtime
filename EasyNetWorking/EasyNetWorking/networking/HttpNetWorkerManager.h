//
//  HttpNetWorkerManager.h
//  异步网路请求框架
//
//  Created by 黄增权 on 15/10/28.
//  Copyright © 2015年 黄增权. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"
#import "HttpResponse.h"
typedef void(^responseblock)(HttpResponse *response);

@interface HttpNetWorkerManager : NSObject
+ (instancetype) manager;
- (void) requestWithRequeter:(HttpRequest *)request response:(responseblock) responseblock;





@end
