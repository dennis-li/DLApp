//
//  HtmlDataManager.h
//  SUES
//
//  Created by 李旭 on 2018/5/8.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"

@interface HtmlDataManager : NSObject

+ (void) requestHtmlDataWithURL:(NSString *) url
                               success:(void (^)(NSData *data)) success
                               failure:(void (^)(void)) failure;

+ (NSString *) valueFromXpathParser:(TFHpple *) parser WithXPathQuery:(NSString *) query;

+ (NSString *) valueFromElement:(TFHppleElement *) element forKey:(NSString *) key;

@end
