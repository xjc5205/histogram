//
//  FHXTrendModel.m
//  FinancerApp
//
//  Created by xjc on 2019/3/4.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import "FHXTrendModel.h"
#import "MJExtension.h"

@implementation FHXTrendModel

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if (oldValue == [NSNull null]) {
        if ([oldValue isKindOfClass:[NSArray class]]) {
            return @[];
        }else if([oldValue isKindOfClass:[NSDictionary class]]){
            return @{};
        }else{
            return @"0";
        }
    }
    return oldValue;
}

@end
