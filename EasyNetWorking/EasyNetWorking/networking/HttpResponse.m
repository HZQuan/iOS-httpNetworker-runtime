//
//  HttpResponse.m
//  异步网路请求框架
//
//  Created by 黄增权 on 15/10/28.
//  Copyright © 2015年 黄增权. All rights reserved.
//

#import "HttpResponse.h"
#import <objc/runtime.h>

@implementation HttpResponse
-(instancetype) initWithData:(id)responseData type:(NSString *)type classname:(NSString *)className;
{
    self = [super init];
    _responseData = responseData;
    _modelClass = className;
    return self;
}

//获取一个类的所有成员变量
-(NSMutableArray *)getPropertyNamesWithClass:(NSString *)classString
{
    Class class = NSClassFromString(classString);
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList(class, &count);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
   // NSLog(@"%d",count);
    for (int i = 0; i<count; i++) {
        const char* propertyName = property_getName(list[i]);
        NSString *strName = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
    //    NSLog(@"%@",strName);
        [array addObject:strName];
    }
    return array;
}

//json解析的数据类型nfarray

-(id) responseModelArray
{
    NSMutableArray *modleArray = [[NSMutableArray alloc] init];
    NSMutableArray *propertyArray = [self getPropertyNamesWithClass:_modelClass];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableLeaves error:nil];
    for (int i = 0; i<array.count; i++) {
        id object = [[NSClassFromString(_modelClass) alloc] init];
        NSDictionary *dictonary = [array objectAtIndex:i];
        
        for (int i=0; i<propertyArray.count; i++) {
            NSString *key = [propertyArray objectAtIndex:i];
            if (dictonary[key] == nil) {
                continue;
            }
            [object setValue:dictonary[key] forKey:key];
            
        }
        [modleArray addObject:object];
        
    }
    
    return modleArray;
}

//json解析的数据类型是nfdictonary

-(id)responseModle
{
    NSMutableArray *array = [self getPropertyNamesWithClass:_modelClass];
    id object = [[NSClassFromString(_modelClass) alloc] init];
    NSDictionary *dictonary = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableLeaves error:nil];
    
    for (int i=0; i<array.count; i++) {
        NSString *key = [array objectAtIndex:i];
        if (dictonary[key] == nil) {
            continue;
        }
        [object setValue:dictonary[key] forKey:key];
    }
    return object;

}



@end
