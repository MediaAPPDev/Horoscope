//
//  AppDelegate.m
//  Horoscope
//
//  Created by 01 on 14/11/25.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "AppDelegate.h"
#import "JDSideMenu.h"
#import "MenuViewController.h"

#import "MainViewController.h" //达人秀
#import "MDMenuViewController.h"


#import "NewMainViewController.h"//达人秀
#import "FoundViewController.h" //发现

#import "FriendsViewController.h" //星友

#import "FriendLoopViewController.h" //星友圈

//#import "WeiboViewControlle.h"

#import "TodayLuckViewController.h" //运势

#import "BdViewController.h" //宝典

#import "XWViewController.h" //星文


//#import "TestViewController.h" //测试
#import "TestViewController.h"
#import "SexttestViewController.h"


#import "GuidePageViewController.h"


#import "NewMainViewController.h"

#import "CircleStarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    //****************************** MDMenuViewController initialisation ******************************************

    
 
//    contentController.view.backgroundColor = [UIColor colorWithHue:0.5 saturation:1.0 brightness:1.0 alpha:1.0];
//    contentController.title = [NSString stringWithFormat: @"Hue: %.2f", 0.5];

    
//    NSArray *viewControllers = [NSArray arrayWithObjects:[[ServicesViewController alloc] initWithNibName:@"ServicesViewController" bundle:nil],[[FavouritViewController alloc] initWithNibName:@"FavouritViewController" bundle:nil],[[ContactUsViewController alloc] initWithNibName:@"ContactUsViewController" bundle:nil],[[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil], nil];
    
    
/*           NSArray *viewControllers = [NSArray arrayWithObjects:[[MainViewController alloc] init],[[FoundViewController alloc] init],[[FriendsViewController alloc] init],[[FriendLoopViewController alloc]  init],[[TodayLuckViewController alloc] init],[[BdViewController alloc] init],[[XWViewController alloc] init],[[TestViewController alloc] init], nil];
 */
//    UIViewController * mainsVC =[[MainViewController alloc] init]    ;
//    
//     UIViewController * FoundVC =[[FoundViewController alloc] init]    ;

    
        NSArray *viewControllers = [NSArray arrayWithObjects:[[NewMainViewController alloc] init],[[FoundViewController alloc] init],[[FriendsViewController alloc] init],[[CircleStarViewController alloc]  init],[[TodayLuckViewController alloc] init],[[BdViewController alloc] init],[[XWViewController alloc] init],[[SexttestViewController alloc] init], nil];
    
    
    
    self.mainViewC = [[MDMenuViewController alloc] initWithChildViewControllers:viewControllers];
    
    
    
    
    //************************************************************************************************************
    
    
    
    
    
    
    
    
    
    
    //****************************** MDMenuViewController customise top bar ******************************************
    
    // set main menu button image
    [self.mainViewC.topBar.menuBtn setImage:[UIImage imageNamed:@"menu_icon (1).png"] forState:UIControlStateNormal];
    
    
    
    // set back button image
    [self.mainViewC.topBar.backBtn setImage:[UIImage imageNamed:@"icon_back_white.png"] forState:UIControlStateNormal];
    
    
    
    // set top bar background color
    [self.mainViewC.topBar setBackgroundColor:[UIColor colorWithWhite:0.85 alpha:1.0]];
    
    
    
    // set top bar title text color
    [self.mainViewC.topBar.titleLbl setTextColor:[UIColor whiteColor]];
    
    
    
    // set top bar background image
    self.mainViewC.topBar.backgroundImage.image = [UIImage imageNamed:@"topBar.jpg"];
    
    
//    [mainViewC.topBar setHidden:YES];
    
    //************************************************************************************************************
    
    
    
    
    
    
    
    
    // MDMenuController background view image
    self.mainViewC.view.backgroundColor = [UIColor colorWithRed:(46.0f/255.0f) green:(46.0f/255.0f) blue:(46.0f/255.0f) alpha:1.0];
    //     mainViewC.view.backgroundColor = [UIColor redColor];
    
    
    
    //if you want to disable or enable content view swipt to the side when menu is shown
    self.mainViewC.contentViewSwiptToTheSideEnabled = YES;
    
    
    
    
    
    
    
    
    //****************************** MDMenuViewController customise menu view ***************************************
    
    
    
    
    
    // menu item title text color when selected
    [self.mainViewC.menuView setMenuItemTitleTextColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    
    
    // menu item title text color when unSelected
    [self.mainViewC.menuView setMenuItemTitleTextColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    // menu item background color when unSelected
    [self.mainViewC.menuView setMenuItemBackgroundColor:[UIColor colorWithRed:(46.0f/255.0f) green:(46.0f/255.0f) blue:(46.0f/255.0f) alpha:1.0] forState:UIControlStateNormal];
    
    
    
    // menu item background color when selected
    [self.mainViewC.menuView setMenuItemBackgroundColor:[UIColor colorWithRed:(47.0f/255.0f) green:(123.0f/255.0f) blue:(154.0f/255.0f) alpha:1.0] forState:UIControlStateHighlighted];
    
    
         // menu vie background color
    
    //tableVIew 背景
    //    [mainViewC.menuView setBackgroundColor:[UIColor colorWithRed:(46.0f/255.0f) green:(46.0f/255.0f) blue:(46.0f/255.0f) alpha:1.0]];
    
    [self.mainViewC.menuView setBackgroundColor:[UIColor colorWithRed:(46.0f/255.0f) green:(46.0f/255.0f) blue:(46.0f/255.0f) alpha:1.0]];
    
    
    
    
    //disabel ripple animation
    
    [self.mainViewC.menuView setDisableRippleAnimation:NO];
    
    
    //************************************************************************************************************
    
    
    
//    [[NSUserDefaults
//      standardUserDefaults]removeObjectForKey:@"FirstLoign"];
    if ([[NSUserDefaults
           standardUserDefaults]objectForKey:@"FirstLoign"]) {
        self.window.rootViewController = self.mainViewC;
    }else{
        GuidePageViewController *guidePageVC = [[GuidePageViewController alloc]init];
        self.window.rootViewController =guidePageVC;
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"FirstLoign"];
    }
    
    
    
    
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor colorWithRed:(135.0f/255.0f) green:(125.0f/255.0f) blue:(111.0f/255.0f) alpha:1.0];
    [self.window makeKeyAndVisible];
    return YES;
    
    
    
    
    
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    [self.window makeKeyAndVisible];
//    
//    MenuViewController *menuController = [[MenuViewController alloc] init];
//    MainViewController *contentController = [[MainViewController alloc] init];
////    contentController.view.backgroundColor = [UIColor colorWithHue:0.5 saturation:1.0 brightness:1.0 alpha:1.0];
////    contentController.title = [NSString stringWithFormat: @"Hue: %.2f", 0.5];
//    
//    UIViewController *navController = [[UINavigationController alloc] initWithRootViewController:contentController];
//    
//    
//    
//    contentController.navigationController.navigationBarHidden=YES;
//    JDSideMenu *sideMenu = [[JDSideMenu alloc] initWithContentController:navController
//                                                          menuController:menuController];
//    
//
//    
////    [sideMenu setBackgroundImage:[UIImage imageNamed:@"menuwallpaper"]];
////    [navController.navigationController.navigationBar setHidden:YES];
//    self.window.rootViewController = sideMenu;
    
//    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
