//
//  PersonInfoChangeViewController.h
//  Horoscope
//
//  Created by Satellite on 14/12/17.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "BaseViewController.h"

@interface PersonInfoChangeViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableDictionary *infoDict;
@end
