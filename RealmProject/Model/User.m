//
//  User.m
//  RealmProject
//
//  Created by zwj on 2017/8/15.
//  Copyright © 2017年 zwj. All rights reserved.
//

#import "User.h"
#import "Post.h"

@implementation User

// 反向关系
+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties{
    return @{
             @"posts":[RLMPropertyDescriptor descriptorWithClass: Post.class propertyName:@"author"]
             };
    
}

@end
