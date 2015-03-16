//
//  FansViewController.h
//  Horoscope
//
//  Created by Satellite on 14/12/23.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "BaseViewController.h"
#import "FriendsCell.h"
@interface FansViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,FriendsDelegate>
@property (nonatomic,assign)BOOL isFans;
@end
