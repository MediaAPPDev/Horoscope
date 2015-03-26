//
//  XWDetailViewController.h
//  Horoscope
//
//  Created by qihonggang on 15-3-24.
//
//

#import "BaseViewController.h"
#import "EGOImageView.h"
@interface XWDetailViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,EGOImageViewDelegate,UITextFieldDelegate>
@property (nonatomic,copy)NSString *aid;
@end
