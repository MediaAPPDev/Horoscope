//
//  XWDetailViewController.h
//  Horoscope
//
//  Created by qihonggang on 15-3-24.
//
//

#import "BaseViewController.h"
#import "EGOImageView.h"
//<<<<<<< HEAD

//@interface XWDetailViewController : BaseViewController<UITextFieldDelegate>
@interface XWDetailViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,EGOImageViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong)NSMutableDictionary  * exampleDic;
//@interface XWDetailCell : UITableViewCell
@property (strong, nonatomic)  UILabel *titleName;
@property (strong, nonatomic)  UILabel *timeLb;
@property (strong, nonatomic)  EGOImageView *imageView;
@property (strong, nonatomic)  UITextView *contentTV;
@property (strong, nonatomic)  UITextField *commTF;
@property (strong, nonatomic)  UIImageView *commTfBackImageView;
@property (strong, nonatomic)  UIButton *commSendButton;
//=======
//@interface XWDetailViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,EGOImageViewDelegate,UITextFieldDelegate>
@property (nonatomic,copy)NSString *aid;
//>>>>>>> origin/master
@end
