//
//  signup3ViewController.m
//  Horoscope
//
//  Created by SAT on 15/1/9.
//
//

#import "signup3ViewController.h"
#import "signup4ViewController.h"

@interface signup3ViewController ()

@end

@implementation signup3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, KISHighVersion_7?20:0, 60, 44)];
    [button setImage:KUIImage(@"wancheng.png") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterNextPage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

    
    [_nicheng setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
//    [_password setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)enterNextPage:(UIButton *)btn
{
    
    signup4ViewController * signStep4 =[[signup4ViewController alloc]init];
    [self.menuController pushViewController:signStep4 withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
    
    
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
