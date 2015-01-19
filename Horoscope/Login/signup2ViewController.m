//
//  signup2ViewController.m
//  Horoscope
//
//  Created by SAT on 15/1/9.
//
//

#import "signup2ViewController.h"
#import "signup3ViewController.h"

@interface signup2ViewController ()

@end

@implementation signup2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, KISHighVersion_7?20:0, 60, 44)];
    [button setImage:KUIImage(@"wancheng.png") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterNextPage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
     [_telPhoneNumber setText:_telNum];
    
    [_sendCode setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    [_password setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self sendTelCode];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)sendTelCode

{
    
//    [UserCache sharedInstance] valueForKey:@""
  
    NSString * parameterStr =[NSString stringWithFormat:@"mobilesms?mobnum=%@",_telNum];
    
    
    [[AFAppDotNetAPIClient sharedClient] GET:parameterStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * state =[NSString stringWithFormat:@"%@",responseObject];
        

        if (![state isEqualToString:@""]) {
            
              [_sendCode setText:state ];
    
        }
        else{
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"验证码返回失败！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        
    }];
    
    
 
    
    
}

-(void)enterNextPage:(UIButton *)btn
{
    
    
    if ([self isEmtity:_password.text] || [self isEmtity:_sendCode.text]) {
        
        
        if ([self isEmtity:_password.text]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }else {
            
       
            
        }
        
        
        if ([self isEmtity:_sendCode.text]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"验证码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    
       
    }else{

        signup3ViewController * signStep3 =[[signup3ViewController alloc]init];
        [self.menuController pushViewController:signStep3 withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
        
    }
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reSendCode:(id)sender {
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
