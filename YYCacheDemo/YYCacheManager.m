//
//  YYCacheManager.m
//  YYCacheDemo
//
//  Created by Qivay on 2017/9/1.
//  Copyright © 2017年 Qivay. All rights reserved.
//

#import "YYCacheManager.h"

@implementation YYCacheManager

+ (instancetype)manager {
    static YYCacheManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YYCacheManager alloc] init];
        
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.userCache = [[YYCache alloc] initWithName:@"jyw.userInfo"];
    }
    return self;
}

- (void)updateUserInfo:(id)userInfo {
    [self.userCache setObject:userInfo forKey:@"info"];
}
- (NSDictionary *)readInfoWithKey:(NSString *)key
{
   id value = [self.userCache objectForKey:key];
    
    
    return value;
}
//- (NSDictionary *)userInfo {
//    if (!_userInfo) {
//        id value = [self.userCache objectForKey:@"info"];
//        NSDictionary *userInfo = (NSDictionary *)value;
//        return userInfo;
//    }
//    return _userInfo;
//}

//- (UserModel *)userModel {
//    if (!_userModel) {
//        if (self.userInfo) {
//            UserModel *employeeModel = [UserModel mj_objectWithKeyValues:self.userInfo];
//            return employeeModel;
//        }
//    }
//    return _userModel;
//}

//- (NSString *)name {
//    return self.userModel.name;
//}
//
//- (NSString *)gender {
//    return self.userModel.gender;
//}
//
//- (NSInteger)age {
//    return self.userModel.age;
//}



@end
