//
//  User.h
//  RealmProject
//
//  Created by zwj on 2017/8/15.
//  Copyright © 2017年 zwj. All rights reserved.
//

#import <Realm/Realm.h>
#import "Post.h"

@interface User : RLMObject

@property NSString *nickname;

// to-many 对多 关系
@property (readonly) RLMLinkingObjects *posts;

@end
