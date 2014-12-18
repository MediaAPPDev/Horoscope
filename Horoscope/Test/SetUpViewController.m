//
//  SetUpViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/18.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "SetUpViewController.h"
#import "SetUpCell.h"

#import "SafeViewController.h"
#import "BangdingViewController.h"
#import "NotifiationViewController.h"
#import "PrivacyViewController.h"
#import "FeedbackViewController.h"

@interface SetUpViewController ()
{
    UITableView * myTableView;
    NSArray * titleArr;
}
@end

@implementation SetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self buildTopviewWithBackButton:NO title:@"设置" rightImage:@""];
    
    myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?64:44, KScreenWidth, 100+40*9+10) style:UITableViewStylePlain];
    myTableView.bounces = NO;
    myTableView.delegate = self;
    myTableView.dataSource = self;

    [self.view addSubview:myTableView];
    
    titleArr = [NSArray arrayWithObjects:@"账号安全",@"账号绑定",@"消息提醒",@"隐私",@"黑名单",@"清理缓存",@"关于",@"反馈意见",@"给我评分",@"退出账号", nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 3;
            break;
        default:
            return 1;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    SetUpCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SetUpCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.titleLabel.text = [titleArr objectAtIndex:(2*indexPath.section+indexPath.row)];
    cell.accessoryType = YES;
    
    if (indexPath.section==0&&indexPath.row==1) {
        cell.isHaveImg = YES;
    }else{
        cell.isHaveImg =NO;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当手指离开某行时，就让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SafeViewController *safe = [[SafeViewController alloc]init];
    BangdingViewController *bd = [[BangdingViewController alloc]init];
    NotifiationViewController *not = [[NotifiationViewController alloc]init];
    PrivacyViewController *priv = [[PrivacyViewController alloc]init];
    FeedbackViewController *fee =[[FeedbackViewController alloc]init];
    
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    [self.menuController pushViewController:safe withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
                    break;
                    case 1:
                    [self.menuController pushViewController:bd withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    [self.menuController pushViewController:safe withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
                    break;
                    case 1:
                    [self.menuController pushViewController:bd withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
                    break;
                default:
                    break;
            }
            
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    [self.menuController pushViewController:not withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
                    break;
                case 1:
                    [self.menuController pushViewController:priv withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
                    break;
                default:
                    break;
            }
            
            break;
        case 3:
            break;
        case 4:
            switch (indexPath.row) {
                case 0:
                    [self.menuController pushViewController:fee withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
                    break;

                default:
                    break;
            }
            
            break;
            
        default:
            break;
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
