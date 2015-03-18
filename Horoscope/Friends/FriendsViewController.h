//
//  FriendsViewController.h
//  Horoscope
//
//  Created by Satellite on 14/12/17.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "BaseViewController.h"
typedef enum
{
    COME_FOLLOW=0,
    COME_FANS,
    COME_FRIENDS,
}MYINFOTYPE;
@interface FriendsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign)MYINFOTYPE myfriendsType;
@end
