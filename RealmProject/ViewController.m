//
//  ViewController.m
//  RealmProject
//
//  Created by zwj on 2017/8/15.
//  Copyright © 2017年 zwj. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"
#import "User.h"
#import <Realm.h>

@interface ViewController ()

@end

@interface Dog : RLMObject
@property NSString *name;
@property NSInteger age;

@end
RLM_ARRAY_TYPE(Dog);
@interface Person : RLMObject
@property NSString *name;
@property RLMArray<Dog *><Dog> * dogs;
@end

@implementation Dog
@end

@implementation Person
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

// 创建一个数据库，记录狗狗的名字和年龄
    Dog *dog = [[Dog alloc]init];
    dog.name = @"Peter";
    dog.age = 1;

//添加一个主人的记录
    Person *owner = [[Person alloc]init];
    owner.name = @"Mike";
    [owner.dogs addObject:dog];

//    NSLog(@"%@",owner);
    
    // 查询年龄小于2岁的狗狗
//    RLMResults* results = [Dog objectsWhere:@"age< 2"];
//    NSLog(@"%@",results);

    // 添加狗狗 数据写入数据库
//    RLMRealm *r = [RLMRealm defaultRealm];
//    [r transactionWithBlock:^{
//        [r addObject:dog];
//    }];
//    NSLog(@"%@",results);
    
    /*
    Post *post = [[Post alloc]initWithValue:@{@"title":@"untitled"}];
    User *user = [[User alloc]init];
    post.author = user;
    
    RLMRealm *r = [RLMRealm defaultRealm];
    
    [r transactionWithBlock:^{
        [r addObject:post];
        [r addObject:user];
        NSLog(@"%@",user.posts);
    }];
    */
    
    // 第三部分  数据的增删改查
    Post *post = [[Post alloc]initWithValue:@{@"title":@"untitled"}];
    post.identifer = [[NSDate date] description];
    RLMRealm *r = [RLMRealm defaultRealm];
    
    [r transactionWithBlock:^{
        // 写入数据
        [r addObject:post];
    }];
    
    // 删除
    [r transactionWithBlock:^{
//        [r deleteObject:post];
//        [r deleteAllObjects];
    }];
    
    // 改
    
    [r transactionWithBlock:^{
       
        post.titlestamp = [NSDate date];
    }];
    
    // 查
    RLMResults *results = [Post objectsWhere:@"title = %@",@"untitled"];
    Post *postBeFound = [results firstObject];
    [r transactionWithBlock:^{
       post.title = @"Test for change"; 
    }];
    NSLog(@"%@",postBeFound);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
