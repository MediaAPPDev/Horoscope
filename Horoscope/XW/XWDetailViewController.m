//
//  XWDetailViewController.m
//  Horoscope
//
//  Created by qihonggang on 15-3-24.
//
//

#import "XWDetailViewController.h"
#import "XWCommentsVC.h"
@class XWViewController;
//@class XWCommentsVC;
@interface XWDetailViewController ()

@end

@implementation XWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTopViewWithTitle:@"星文" withBackButton:YES];
    self.view.backgroundColor = [UIColor cyanColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-80, KISHighVersion_7?20:0, 80, 44)];
//    [button setImage:KUIImage(@"123123") forState:UIControlStateNormal];
    [button setTitle:@"12345评论>" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:12];
    [button addTarget:self action:@selector(enterNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}

-(void) enterNextPage
{
    XWCommentsVC *commentVC = [[XWCommentsVC alloc] init];
    //    derailVC
    [self.menuController pushViewController:commentVC withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

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
