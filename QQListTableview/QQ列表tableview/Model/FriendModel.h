//
//  FriendModel.h
//  QQ列表tableview
//
//  Created by 张俊 on 2018/9/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject

/** QQ好友昵称  */
@property (nonatomic,copy) NSString *name;

/** 状态  */
@property (nonatomic,copy) NSString *mode;

/** 头像  */
@property (nonatomic,copy) NSString * icon;
@end
