//
//  BaseViewController.h
//  Demo4
//
//  Created by Satellite on 14/11/27.
//  Copyright (c) 2014年 Satellite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDSideMenu.h"
#import "UIViewController+JDSideMenu.h"
#import "MDMenuChildViewController.h"
//#import "JDSideMenu.h"
@interface BaseViewController : MDMenuChildViewController
{
    float startX;//IOS 7或者以下 适配屏幕
}
-(void)buildTopviewWithBackButton:(BOOL)isHave title:(NSString *)title rightImage:(NSString *)rightImage;
-(void)buildScrollViewWithFrame:(CGRect)frame contentSize:(CGSize)size Image:(NSString *)image;
- (void) gotoViews;
-(float)niub:(float)a;

- (void)setTopViewWithTitle:(NSString*)titleStr withBackButton:(BOOL)hasBacButton;
-(void)showAlertViewWithtitle:(NSString *)title message:(NSString *)message;

- (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;
@property (nonatomic,strong)MBProgressHUD *hud;

- (void)showMessageWindowWithContent:(NSString*)content imageType:(NSInteger)imageType;

// [self.menuController showMenu:self.menuController.topBar ];
/*
 
 创建Label快捷方式
 */

-(UILabel *)buildLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textClolr font:(UIFont *)font textAlignment:(NSTextAlignment)alignment text:(NSString*)text;
- (void)setExtraCellLineHidden: (UITableView *)tableView;
@property(nonatomic,strong) UIButton * leftButton;
@end
