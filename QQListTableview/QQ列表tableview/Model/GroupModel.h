//
//  GroupModel.h
//  QQ列表tableview
//
//  Created by 张俊 on 2018/9/16.
//  Copyright © 2018年 zhangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject

/** 组名  */
@property (nonatomic, copy) NSString *groupname;

/** 组员  */
@property (nonatomic, copy) NSArray *friends;

/** 是否打开  */
@property (nonatomic, assign) BOOL  isOpen;

@end
