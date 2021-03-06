//
//  LoginViewController.h
//  Horoscope
//
//  Created by SAT on 14/12/11.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^LoginBlock)(id info);

@interface LoginViewController : BaseViewController<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *forgetPassword;
@property(nonatomic, copy)LoginBlock successBlock;

@end
