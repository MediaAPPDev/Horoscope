//
//  XWDetailCell.h
//  Horoscope
//
//  Created by qihonggang on 15-3-24.
//
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface XWDetailCell : UITableViewCell
@property (strong, nonatomic)  UILabel *titleName;
@property (strong, nonatomic)  UILabel *timeLb;
@property (strong, nonatomic)  UIImage *image;
@property (strong, nonatomic)  UITextView *contentTV;
@property (strong, nonatomic)  UITextField *commTF;
@property (strong, nonatomic)  UIImageView *commTfBackImageView;
@property (strong, nonatomic)  UIButton *commSendButton;

//@property (strong, nonatomic)  nsa
//@property (strong, nonatomic)  UIButton *share;
//@property (strong, nonatomic)  UIButton *share;
//@property (strong, nonatomic)  UIButton *share;
//@property (strong, nonatomic)  UIButton *share;

@end
