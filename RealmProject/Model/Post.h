//
//  Post.h
//  RealmProject
//
//  Created by zwj on 2017/8/15.
//  Copyright © 2017年 zwj. All rights reserved.
//

#import <Realm/Realm.h>
RLM_ARRAY_TYPE(Post)
@class  User;
@interface Post : RLMObject


@property NSString *identifer;
// title 标题
@property NSString *title;

// author to- one 关系 一对一关系
@property User *author;

//  时间戳
@property NSDate * titlestamp;

// 内容
@property NSData *content;

// 浏览量

@property NSNumber <RLMInt>* look;

// 回帖 对多关系
@property RLMArray <Post*><Post> *comments;

// 置顶 bool
@property NSNumber <RLMBool>* isTop;

// 不支持的类型  cgfloat. 请使用 float double

@end
