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
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, KISHighVersion_7?20:0, 60, 44)];
    [button setImage:KUIImage(@"wancheng.png") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterNextPage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    
    [_telPhoneNumber setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)enterNextPage:(UIButton *)btn
{
    
    
    if ([self isEmtity:_telPhoneNumber.text]) {
        
        //        NSString * strafsdf =null;
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"用户名和密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }else{
        
   
        
        if (_telPhoneNumber.text.length <11)
        {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"错误" message:@"用户名不能小于11位！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            
            
        }else{
            
 
        
            [[UserCache sharedInstance] setValue:_telPhoneNumber.text forKey:@"regTel"];
            
            
            signup2ViewController * signStep2 =[[signup2ViewController alloc]init];
            
            signStep2.telNum =[NSMutableString stringWithString:_telPhoneNumber.text];
            
            [self.menuController pushViewController:signStep2 withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
            
            
        }
    }


    

    
    
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
