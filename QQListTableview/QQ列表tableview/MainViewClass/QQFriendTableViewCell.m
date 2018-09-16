//
//  QQFriendTableViewCell.m
//  QQ列表tableview
//
//  Created by 张俊 on 2018/9/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "QQFriendTableViewCell.h"
#import "FriendModel.h"


@interface QQFriendTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *modeLabel;


@end

@implementation QQFriendTableViewCell

//设置数据
- (void)setFriends:(FriendModel *)friends{
    _friends = friends;
    self.iconImageView.image = [UIImage imageNamed:friends.icon];
    self.nameLabel.text = friends.name;
    self.modeLabel.text = friends.mode;
}

@end



