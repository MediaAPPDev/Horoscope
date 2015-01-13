//
//  LoginViewController.m
//  Horoscope
//
//  Created by SAT on 14/12/11.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "LoginViewController.h"
#import "signup1ViewController.h"
#import "NewMainViewController.h"
#import "UserCache.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTopViewWithTitle:@"登录" withBackButton:YES];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, KISHighVersion_7?20:0, 60, 44)];
    [button setImage:KUIImage(@"wancheng.png") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterNextPage:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:button];
    
    
    
    [_username setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    [_password setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)enterNextPage:(UIButton *)btn
{
    
    if ([self isEmtity:_username.text]||[ self isEmtity:_password.text]) {
        
//        NSString * strafsdf =null;
        
       
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"用户名和密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
       
        
    }else{
        
        
        if (_username.text.length <11)
        {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"用户名不能小于11位！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            
            
        }else{
            NSString * loginStr =[NSString stringWithFormat:@"veruser?mobilenum=%@",_username.text];
            
            //        [NSString stringWithFormat:<#(NSString *), ...#>]
            
            [[AFAppDotNetAPIClient sharedClient] GET:loginStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                NSString * state =[NSString stringWithFormat:@"%@",responseObject];
                
                [[UserCache sharedInstance] setValue:state forKey:@"userCode"];
                
//                [[UserCache sharedInstance] setValue:_username forKey:<#(NSString *)#>]
                
//                UIButton * btn =[UIButton buttonWithType:UIButtonTypeContactAdd];
//                btn setBackgroundImage:<#(UIImage *)#> forState:<#(UIControlState)#>
            
//                NSString * strsd =[[UserCache sharedInstance] objectForKey:@"userCode"];
                
                if (![state isEqualToString:@""]) {
                    
                    
                    
                    
                    NewMainViewController * mainVC =[[NewMainViewController alloc]init];
                    [self.menuController pushViewController:mainVC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
                    
                    
                    
                    
                }
                else{
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"用户不存在！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alert show];
                    
                }
                
                
                
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                
                
                
            }];
            
            
            
        }
        
        

        
        
        
    }
    

    
    

    
}



-(NSString*)titleForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"注册登录";
}
-(NSString*)iconForChildControllerMDMenuViewController:(MDMenuViewController *)menuController
{
    return @"xingwen.png";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

    // Dispose of any resources that can be recreated.
}
- (IBAction)forgetPasswordAction:(id)sender {
    
    
    

    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
