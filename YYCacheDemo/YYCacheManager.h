//
//  YYCacheManager.h
//  YYCacheDemo
//
//  Created by Qivay on 2017/9/1.
//  Copyright © 2017年 Qivay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYCache.h>
@interface YYCacheManager : NSObject
+ (instancetype)manager;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *gender;
@property (nonatomic, assign, readonly) NSInteger age;
//@property (nonatomic, strong) UserModel *userModel;
@property (nonatomic, strong) YYCache *userCache;

- (void)updateUserInfo:(id)userInfo;

- (NSDictionary *)readInfoWithKey:(NSString *)key;

@end
