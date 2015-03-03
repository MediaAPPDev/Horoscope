//
//  signup1ViewController.m
//  Horoscope
//
//  Created by SAT on 15/1/9.
//
//

#import "signup1ViewController.h"
#import "signup2ViewController.h"

@interface signup1ViewController ()

@end

@implementation signup1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setTopViewWithTitle:@"第一步" withBackButton:NO];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-60, KISHighVersion_7?20:0, 60, 44)];
    [button setImage:KUIImage(@"wancheng.png") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterNextPage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, KISHighVersion_7 ? 20 : 0, 65, 44)];
    [backButton setImage:KUIImage(@"back") forState:UIControlStateNormal];
    [backButton setImage:KUIImage(@"back") forState:UIControlStateHighlighted];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];

    
    
    [_telPhoneNumber setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    _telPhoneNumber.keyboardType = UIKeyboardTypeNumberPad;

    // Do any additional setup after loading the view from its nib.
}

-(void)backButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

-(void)enterNextPage:(UIButton *)btn
{
    
//<<<<<<< HEAD
    if ([self isEmtity:_telPhoneNumber.text] ) {
        [self showAlertViewWithtitle:@"提示" message:@ "手机号不能为空"];
    }else if (_telPhoneNumber.text.length !=11||![self isPureInt:_telPhoneNumber.text]||![_telPhoneNumber.text hasPrefix:@"1"])
    {
        [self showAlertViewWithtitle:@"提示" message:@"请输入正确的手机号"];
    }
    else{
        
        NSString * loginStr =[NSString stringWithFormat:@"veruser?mobilenum=%@",_telPhoneNumber.text];
        
        [[AFAppDotNetAPIClient sharedClient] GET:loginStr parameters:nil success:^ (NSURLSessionDataTask *task, id responseObject) {
            NSString * state   =KISDictionaryHaveKey(responseObject, @"id");
            NSLog(@"😄－－－－－－－%@",state);
            if ([state isEqualToString:@"0"]) {
                [[UserCache sharedInstance] setObject:_telPhoneNumber.text forKey:@"regTel"];
                signup2ViewController * signStep2 =[[signup2ViewController alloc]init];
                signStep2.telNum =[NSMutableString stringWithString:_telPhoneNumber.text];
                [self.navigationController pushViewController:signStep2 animated:YES];
//                [self.menuController pushViewController:signStep2 withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
            }else{
                [self showAlertViewWithtitle:@"提示" message:@"此账号已被注册"];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
        }];


    }
//=======
    
//    if ([self isEmtity:_telPhoneNumber.text]) {
//        
//        //        NSString * strafsdf =null;
//        
//        
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"用户名和密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        
//        
//    }else{
//        
//   
//        
//        if (_telPhoneNumber.text.length <11)
//        {
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"用户名不能小于11位！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [alert show];
//            
//            
//        }else{
//            
// 
//        
//  
//
//            
//            signup2ViewController * signStep2 =[[signup2ViewController alloc]init];
//            
//            
//            [self.menuController pushViewController:signStep2 withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
//            
//            
//        }
//    }


    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
