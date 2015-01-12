//
//  SingupViewController.m
//  Horoscope
//
//  Created by SAT on 15/1/9.
//
//

#import "SingupViewController.h"
#import "LoginViewController.h"
#import "signup1ViewController.h"

@interface SingupViewController ()

@end

@implementation SingupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginAction:(id)sender{
    
    
    //登录

    LoginViewController * logVC =[[LoginViewController alloc]init];
    
            [self.menuController pushViewController:logVC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];

    
}
- (IBAction)regeAction:(id)sender{
    
    
//    注册
    signup1ViewController * signUp1VC =[[signup1ViewController alloc]init];
    
    [self.menuController pushViewController:signUp1VC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];

    
    
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
