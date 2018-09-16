//
//  HeadView.h
//  QQ列表tableview
//
//  Created by 张俊 on 2018/9/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeadView,GroupModel;

@protocol SectionHeadViewDelegate<NSObject>
-(void)sectionHeadButtonDidClicked:(HeadView *)headView;
@end

@interface HeadView : UIView
/** 代理  */
@property (nonatomic,strong) id<SectionHeadViewDelegate>delegate;

/** 模型  */
@property (nonatomic,strong) GroupModel * group;
@end
