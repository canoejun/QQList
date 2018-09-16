//
//  ViewController.m
//  QQ列表tableview
//
//  Created by 张俊 on 2018/9/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import "QQViewController.h"
#import "MJExtension.h"
#import "GroupModel.h"
#import "FriendModel.h"
#import "QQFriendTableViewCell.h"
#import "HeadView.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KHeadViewH 40


@interface QQViewController ()<SectionHeadViewDelegate>
/** 保存模型数据的数组  */
@property (nonatomic,copy) NSArray *QQDataArray;

@end

@implementation QQViewController

-(NSArray *)QQDataArray{
    if (!_QQDataArray) {
//        告诉group中array的成员是一个个的dictionary
        [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"friends":[FriendModel class]};
        }];
        _QQDataArray = [GroupModel mj_objectArrayWithFilename:@"qq.plist"];
    }
    return _QQDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 清除底部多余cell
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    // 清除分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.rowHeight = 50;
    self.tableView.sectionHeaderHeight = 50;
    
}

#pragma mark ------ UITableviewDataSource方法 ------

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.QQDataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.QQDataArray[section] isOpen]) {
        return [[self.QQDataArray[section] friends] count];
    }else{
        return 0;
    }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"qq";
    QQFriendTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
//    设置数据
    GroupModel * group = self.QQDataArray[indexPath.section];
    FriendModel * friend = group.friends[indexPath.row];
    cell.friends = friend;
    return cell;
}
//设置分组的headView
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeadView * view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HeadView class]) owner:nil options:nil] firstObject];
    view.delegate = self;
    view.group = _QQDataArray[section];
    return view;
}

#pragma mark ------ 实现代理方法 ------
-(void)sectionHeadButtonDidClicked:(HeadView *)headView{
    [self.tableView reloadData];
}

@end





