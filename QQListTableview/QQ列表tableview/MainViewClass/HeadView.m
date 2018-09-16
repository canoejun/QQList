//
//  HeadView.m
//  QQ列表tableview
//
//  Created by 张俊 on 2018/9/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "HeadView.h"
#import "GroupModel.h"

@interface HeadView ()
@property (weak, nonatomic) IBOutlet UIButton *pullButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *membersCountLabel;

@end

@implementation HeadView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.pullButton addTarget:self action:@selector(pullButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)pullButtonClicked:(UIButton *)sender {
    _group.isOpen = !_group.isOpen;
    if ([self.delegate respondsToSelector:@selector(sectionHeadButtonDidClicked:)]) {
        [self.delegate sectionHeadButtonDidClicked:self];
    }
}
/*
 *   协议方法会刷新tableview,然后会刷新tableview的viewForHeaderInSection:方法 就会重新布局headView所以会走layoutSubviews方法
 */
-(void)layoutSubviews{
    if (!_group.isOpen) {
        _pullButton.transform = CGAffineTransformMakeRotation(-M_PI_2);
    }else{
        _pullButton.transform = CGAffineTransformIdentity;
    }
}
//设置数据
-(void)setGroup:(GroupModel *)group{
    _group = group;
    _titleLabel.text = group.groupname;
    _membersCountLabel.text = [NSString stringWithFormat:@"%ld",group.friends.count];
}




@end





