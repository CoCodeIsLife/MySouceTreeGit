//
//  ViewController.m
//  YYCacheDemo
//
//  Created by Qivay on 2017/9/1.
//  Copyright © 2017年 Qivay. All rights reserved.
//

#import "ViewController.h"
#import <YYCache.h>
#import "YYCacheManager.h"
@interface ViewController ()
{
    YYCache *myCache;
    NSString *valueStr;
    NSString *keyStr;
    NSDictionary *dict;
    YYCacheManager *manager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIButton *buttonWrite = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonWrite.frame = CGRectMake(50, 80, 80, 60);
    
    [buttonWrite setTitle:@"存" forState:UIControlStateNormal];
    buttonWrite.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:buttonWrite];
    
    [buttonWrite addTarget:self action:@selector(writeMethed) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *buttonRead = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonRead.frame = CGRectMake(250, 80, 80, 60);
    
    [buttonRead setTitle:@"取" forState:UIControlStateNormal];
    buttonRead.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:buttonRead];
    
    [buttonRead addTarget:self action:@selector(readMethed) forControlEvents:UIControlEventTouchUpInside];
    
    manager = [YYCacheManager manager];
    
}
- (void)writeMethed
{
    valueStr = @"12000102034586789504958768";
    keyStr = @"key1";
    dict = @{@"1":@"gg",@"2":@"fg"};
    
    myCache = [YYCache cacheWithName:@"myCache1"];
    
    [myCache setObject:dict forKey:keyStr];
    
    NSLog(@"已经点击了");
    
    [manager updateUserInfo:dict];
    

    
}

- (void)readMethed
{
    BOOL isContains=[myCache containsObjectForKey:keyStr];
    NSLog(@"containsObject : %@", isContains?@"YES":@"NO");
    //根据key读取数据
    id vuale=[myCache objectForKey:keyStr];
    
    NSLog(@"value : %@",vuale[@"1"]);
    //根据key移除缓存
    [myCache removeObjectForKey:keyStr];
    
    
    NSDictionary *dict = [manager readInfoWithKey:@"info"];
    
    NSLog(@"dict ==== %@",dict);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end









