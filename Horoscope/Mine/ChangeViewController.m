//
//  ChangeViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/17.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()
{
    UITextField *tf;
}
@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self buildTopviewWithBackButton:NO title:@"修改" rightImage:@""];
    self.navigationController.navigationBarHidden = YES;
    [self setTopViewWithTitle:@"修改" withBackButton:NO];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-60, KISHighVersion_7?20:0, 60, 44)];
//    [button setImage:KUIImage(@"123123") forState:UIControlStateNormal];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backToLastPage:) forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];

    
    UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, KISHighVersion_7 ? 20 : 0, 65, 44)];
    [backButton setImage:KUIImage(@"back") forState:UIControlStateNormal];
    [backButton setImage:KUIImage(@"back") forState:UIControlStateHighlighted];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];

    
    
    tf =[[UITextField alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth-40, 40)];
    tf.center = CGPointMake(KScreenWidth/2, (KISHighVersion_7?64:44)+40);
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.text = [self.contentDic objectForKey:@"info"];
    [self.view addSubview:tf];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)backButtonClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)backToLastPage:(id)sender
{
    hud.labelText = @"修改中...";
    [hud show:YES];
    NSDictionary *dict = [[UserCache sharedInstance]objectForKey:MYINFODICT];
    
    if ([KISDictionaryHaveKey(self.contentDic, @"key")isEqualToString:@"nickname"]&&tf.text.length>10) {
        [self showAlertViewWithtitle:@"提示" message:@"昵称要小于10字符"];
        return;
    }

    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[[UserCache sharedInstance]objectForKey:KMYUSERID] forKey:@"uid"];
    [dic setObject:[[UserCache sharedInstance]objectForKey:KPASSWORD] forKey:@"password"];
    [dic setObject:KISDictionaryHaveKey(dict, @"username") forKey:@"mobilenum"];
    [dic setObject:KISDictionaryHaveKey(dict, @"userage") forKey:@"age"];
    [dic setObject:KISDictionaryHaveKey(dict, @"nickname") forKey:@"nickname"];
    [dic setObject:KISDictionaryHaveKey(dict, @"phrase") forKey:@"phrase"];
    [dic setObject:KISDictionaryHaveKey(dict, @"face") forKey:@"face"];
    [dic setObject:KISDictionaryHaveKey(dict, @"jobs") forKey:@"jobs"];
    [dic setObject:KISDictionaryHaveKey(dict, @"personal") forKey:@"personal"];
    
//    [dic setObject: @"15510106271" forKey:@"mobilenum"];
//    [dic setObject: @"19890416" forKey:@"birthday"];
//    [dic setObject:@"一直很安静" forKey:@"nickname"];
//    [dic setObject:@"phrase" forKey:@"phrase"];
//    [dic setObject:@"白羊座" forKey:@"xing"];

    
    if ([[dic allKeys]containsObject:KISDictionaryHaveKey(self.contentDic, @"key")]) {
        [dic removeObjectForKey:KISDictionaryHaveKey(self.contentDic, @"key")];
    }
    [dic setObject:tf.text forKey:KISDictionaryHaveKey(self.contentDic, @"key")];
    
    
    
    
    
    [[AFAppDotNetAPIClient sharedClient]POST:@"usermodify" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        [hud hide:YES];
        [self showMessageWindowWithContent:@"修改成功" imageType:0];
        [self getInfoFromNetWithUserid];
//        [self.menuController popViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [hud hide:YES];
        [self showAlertViewWithtitle:@"提示" message:@"修改失败"];
    }];
    
    [self.menuController popViewControllerAnimated:YES];
//    [self.navigationController popViewControllerAnimated:YES];
}
-(void)getInfoFromNetWithUserid
{
    NSString * urlStr = [NSString stringWithFormat:@"userdetail.php?uid=%@&uuid=1",[[UserCache sharedInstance]objectForKey:KMYUSERID ]];
    [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary * infoDict = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            [[UserCache sharedInstance]setObject:infoDict forKey:MYINFODICT];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"LOIGNSUCCESS_WX_LIANGSHABI" object:nil];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"REFRESHMINEPAGE" object:nil];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self showAlertViewWithtitle:@"提示" message:@"请求失败"];
    }];
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
