//
//  BaseViewController.m
//  Demo4
//
//  Created by Satellite on 14/11/27.
//  Copyright (c) 2014年 Satellite. All rights reserved.
//

#import "BaseViewController.h"
#import "JDSideMenu.h"
#import "MenuViewController.h"
#import "MainViewController.h"
//#import "UIViewController+JDSideMenu.h"
//#import "JDSideMenu.h"
@implementation BaseViewController
{
    UILabel * baseTitleLabel;
    UIActivityIndicatorView * m_loginActivity;
    float baseTopHeight;
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self) {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        

        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:self];
        
        nav.navigationBarHidden = YES;
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
//    if (KISHighVersion_7) { // 判断是否是IOS7
    

        
//    }

}
/*
 创建tabbar头条快捷方式
 */
-(void)buildTopviewWithBackButton:(BOOL)isHave title:(NSString *)title rightImage:(NSString *)rightImage
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, KISHighVersion_7?64:44)];
    imageView.backgroundColor = [UIColor colorWithRed:0/225.0f green:0/225.0f blue:0/225.0f alpha:1];
    imageView.image =[UIImage imageNamed:@""];
    imageView.userInteractionEnabled =  YES;
    [self.view bringSubviewToFront:imageView];
    [self.view addSubview:imageView];
    
    //    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, self.view.bounds.size.width-140, 44)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, KISHighVersion_7?20:0, self.view.bounds.size.width-140, 44)];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:22];
    label.textAlignment =NSTextAlignmentCenter;
    label.backgroundColor= [UIColor clearColor];

    label.textColor = [UIColor whiteColor];
    
    [imageView addSubview:label];
    
    
    _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, KISHighVersion_7?20:0, 60, 44)];
    [_leftButton setImage:[UIImage imageNamed:@"emnu.png"] forState:UIControlStateNormal];
    [imageView addSubview:_leftButton];
    
    
//    [leftButton addTarget:self action:@selector(tapTheLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, KISHighVersion_7?20:0, 60, 44)];
    
    [rightButton setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
    if (isHave) {
        rightButton.hidden = NO;
    }else{
        rightButton.hidden = YES;
    }
    [imageView addSubview:rightButton];
    
    [self.leftButton addTarget:self action:@selector(gotoMenu:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)gotoMenu:(UIButton  * )btn
{

    
    
    [self.menuController showMenu:self.menuController.topBar];
    
    //
    
}
//- (void)tapTheLeftButton:(UIGestureRecognizer *)gesture
//{
//    
////  <#condition#>) {
////        <#statements#>  if (
////    }
////    JDSideMenu * sideMenu =[[JDSideMenu alloc]init];
////    
////    
////    
////   [ sideMenu showMenuAnimated:YES];
//
//    
//}



/*
 
 这玩意先不用
 */
-(float)niub:(float)a
{
    if (KScreenWidth==320) {
        return a;
    }
    else if(KScreenWidth ==375){
        return a/320*375;
    }else
    {
        return a/320*414;
    }
}



-(void)buildScrollViewWithFrame:(CGRect)frame contentSize:(CGSize)size Image:(NSString *)image
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = size;
    [self.view addSubview:scrollView];
    
    UIImageView *imageView =[[ UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, size.height)];
    imageView.image = [UIImage imageNamed:image];
    [scrollView addSubview:imageView];
}


-(UILabel *)buildLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textClolr font:(UIFont *)font textAlignment:(NSTextAlignment)alignment text:(NSString*)text
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.backgroundColor =backgroundColor;
    label.textColor =textClolr;
    label.font = font;
    label.textAlignment = alignment;
    label.text = text;
    return label;
}


- (void)setTopViewWithTitle:(NSString*)titleStr withBackButton:(BOOL)hasBacButton
{
    UIImageView* topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KISHighVersion_7 ? 64 : 44)];
    topImageView.userInteractionEnabled = YES;
    topImageView.backgroundColor = kColorWithRGB(0, 0, 0, 1.0);
    topImageView.image = KUIImage(@"nav_bg");
    [self.view addSubview:topImageView];
    
//    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTopViewClick:)];
//    tapGesture.delegate = self;
//    [topImageView addGestureRecognizer:tapGesture];
    
    baseTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, KISHighVersion_7 ? 20 : 0, KScreenWidth-100, 44)];
    baseTitleLabel.textColor = [UIColor whiteColor];
    baseTitleLabel.backgroundColor = [UIColor clearColor];
    baseTitleLabel.text = titleStr;
    baseTitleLabel.textAlignment = NSTextAlignmentCenter;
    baseTitleLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:baseTitleLabel];
    
    m_loginActivity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    m_loginActivity.color = [UIColor whiteColor];
    m_loginActivity.activityIndicatorViewStyle =UIActivityIndicatorViewStyleWhite;
    [self.view addSubview:m_loginActivity];
    [self changeActivityPositionWithTitle:baseTitleLabel.text];
    
    if (hasBacButton) {
        UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, KISHighVersion_7 ? 20 : 0, 65, 44)];
        [backButton setImage:KUIImage(@"back") forState:UIControlStateNormal];
        [backButton setImage:KUIImage(@"back") forState:UIControlStateHighlighted];
        backButton.backgroundColor = [UIColor clearColor];
        [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backButton];
    }
}

//根据标题的长度更改UIActivity的位置
-(void)changeActivityPositionWithTitle:(NSString *)title
{
    CGSize size = [title sizeWithFont:baseTitleLabel.font constrainedToSize:CGSizeMake(220, 30)];
    //文字的左起位置
    float title_left_x = 160 - size.width/2;
    if (title_left_x<50) {  //不会超过左边界
        title_left_x = 50;
    }
    m_loginActivity.frame = CGRectMake(title_left_x-20, KISHighVersion_7?27:7, 20, 20);
    m_loginActivity.center = CGPointMake(title_left_x-20, KISHighVersion_7?42:22);
    
}

-(void)showAlertViewWithtitle:(NSString *)title message:(NSString *)message
{
    UIAlertView *ale = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [ale show];
}



/**
 *  返回按钮关闭页面
 *
 *  @param sender
 */
- (void)backButtonClick:(id)sender
{
//    [self.navigationController popViewControllerAnimated:YES];
    
    [self.menuController popViewControllerAnimated:YES];
    
//    [[RequestTaskService singleton] clearRequest:[NSString stringWithUTF8String:object_getClassName(self)]];
    
}

//去除无数据时tableview下方的各种横线
- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

//计算lable高度


- (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize

{
    
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    
//    [paragraphStyle release];
    
    labelSize.height=ceil(labelSize.height);
    
    labelSize.width=ceil(labelSize.width);
    
    return labelSize;
    
}


@end
