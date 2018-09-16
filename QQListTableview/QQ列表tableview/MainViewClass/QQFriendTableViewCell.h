//
//  QQFriendTableViewCell.h
//  QQ列表tableview
//
//  Created by 张俊 on 2018/9/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendModel;

@interface QQFriendTableViewCell : UITableViewCell

/** 模型  */
@property (nonatomic,copy) FriendModel * friends;

@end
