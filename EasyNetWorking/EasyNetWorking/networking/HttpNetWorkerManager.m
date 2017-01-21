//
//  HttpNetWorkerManager.m
//  异步网路请求框架
//
//  Created by 黄增权 on 15/10/28.
//  Copyright © 2015年 黄增权. All rights reserved.
//

#import "HttpNetWorkerManager.h"

@implementation HttpNetWorkerManager
+(instancetype)manager
{
    static dispatch_once_t once;
    static HttpNetWorkerManager *manager = nil;
    dispatch_once(&once, ^{
        manager = [[super alloc]init];
        
    });
    
    return manager;

}
-(NSOperationQueue *) shareOperationQueue
{
    static NSOperationQueue *queue = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        queue = [[NSOperationQueue alloc] init];
    });

    return queue;
}

-(NSString *)paramsStringWithDictonary:(NSDictionary*)dictonary
{
    NSString *params =@"";
    NSArray *allkeys = [dictonary allKeys];
    NSArray *allobjects = [dictonary allValues];
    for (int i =0; i<allkeys.count; i++) {
        NSString *param = [NSString stringWithFormat:@"%@=%@",[allkeys objectAtIndex:i],[allobjects objectAtIndex:i]];
        if ([params isEqualToString:@""]) {
            params = param;
        }else{
            params = [params stringByAppendingString:@"&"];
            params = [params stringByAppendingString:param];
        }
         NSLog(@"%@",params);
    }
    
    return params;
}

-(NSMutableURLRequest*)getWithRequest:(HttpRequest*) request
{
    
    NSString *params = [self paramsStringWithDictonary:request.params];
    NSString *stringUrl = [NSString stringWithFormat:@"%@?%@",request.requestUrl,params];
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *urlrequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    urlrequest.HTTPMethod = @"GET";
    
    return urlrequest;

}

-(NSMutableURLRequest *) postWithRequest:(HttpRequest*) request
{
    NSURL *url = [NSURL URLWithString:request.requestUrl];
    NSMutableURLRequest *urlRequset = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    urlRequset.HTTPMethod = @"POST";
    urlRequset.HTTPBody = [[self paramsStringWithDictonary:request.params] dataUsingEncoding:NSUTF8StringEncoding];
    return urlRequset;


}


//发送post请求或者get请求
-(void)requestWithRequeter:(HttpRequest *)request response:(responseblock)responseblock
{
    NSOperationQueue *queue = [self shareOperationQueue];
    NSMutableURLRequest *urlRequest;
    switch (request.method) {
        case get:
        {
            urlRequest = [self getWithRequest:request];
        }
            break;
        case post:
        {
            urlRequest = [self postWithRequest:request];
        }
            
            break;
        default:
            break;
    }
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"%@",connectionError);
        }
        NSLog(@"%@",response.MIMEType);
        NSLog(@"%@",response.textEncodingName);
        id dictonary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",dictonary);
        HttpResponse *httpresponse = [[HttpResponse alloc] initWithData:data type:response.MIMEType classname:request.modleName];
    
        responseblock(httpresponse);
    }];

}



@end
