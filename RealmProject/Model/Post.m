//
//  Post.m
//  RealmProject
//
//  Created by zwj on 2017/8/15.
//  Copyright © 2017年 zwj. All rights reserved.
//

#import "Post.h"

@implementation Post

// 可空属性，决定属性是否可以为nil

+ (NSArray<NSString *> *)requiredProperties{
    
    
    return @[@"title"];
    
}

// 忽略属性
+ (NSArray<NSString *> *)ignoredProperties{
    return @[];
}

// 默认值

+ (NSDictionary *)defaultPropertyValues{
    
    return @{@"look":@(0)};
}

// 索引属性

+ (NSArray<NSString *> *)indexedProperties{
    
    return @[@"title",@"tilestamp"];
    
}
// 主键 唯一性
+ (NSString *)primaryKey{
    
    return @"identifer";
}


@end
