//
//  HtmlDataManager.m
//  SUES
//
//  Created by 李旭 on 2018/5/8.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import "HtmlDataManager.h"
#import <AFNetworking.h>

@implementation HtmlDataManager

+ (instancetype)sharedManager {
    static HtmlDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [HtmlDataManager new];
    });
    
    return _sharedManager;
}

+ (void) requestHtmlDataWithURL:(NSString *) url
                               success:(void (^)(NSData *data)) success
                               failure:(void (^)(void)) failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSData *htmlData=[result dataUsingEncoding:NSUTF8StringEncoding];
        
        if (success) {
            success(htmlData);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure();
        }
    }];
}

+ (NSString *) valueFromXpathParser:(TFHpple *) parser WithXPathQuery:(NSString *) query
{
    if (![parser isKindOfClass:[TFHpple class]] || ![query isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSArray *elements  = [parser searchWithXPathQuery:query];
    if (!elements.count) {
        return nil;
    }
    
    TFHppleElement *element = elements.firstObject;
    NSString *value = element.content;
    
    return value;
}

+ (NSString *) valueFromElement:(TFHppleElement *) element forKey:(NSString *) key
{
    if (![element isKindOfClass:[TFHppleElement class]]) {
        return nil;
    }
    
    NSDictionary *attributes = element.attributes;
    NSString *value = attributes[key];
    
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    
    return nil;
}


@end
