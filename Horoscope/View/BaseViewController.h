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
//#import "JDSideMenu.h"
@interface BaseViewController : UIViewController
-(void)buildTopviewWithBackButton:(BOOL)isHave title:(NSString *)title rightImage:(NSString *)rightImage;
-(void)buildScrollViewWithFrame:(CGRect)frame contentSize:(CGSize)size Image:(NSString *)image;
- (void) gotoViews;
@property(nonatomic,strong) UIButton * leftButton;
@end
