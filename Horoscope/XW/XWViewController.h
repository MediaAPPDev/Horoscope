//
//  XWViewController.h
//  Horoscope
//
//  Created by Satellite on 14/12/4.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "BaseViewController.h"

@interface XWViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong)NSArray * allArray;

@property (nonatomic,strong)UITableView * tableView;

@end
