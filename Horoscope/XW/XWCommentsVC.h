//
//  XWCommentsVC.h
//  Horoscope
//
//  Created by qihonggang on 15-3-26.
//
//

#import "BaseViewController.h"
#import "XWCommentCell.h"
@interface XWCommentsVC : BaseViewController<UITableViewDataSource,UITableViewDelegate,commentCellDelegate,UITextFieldDelegate>
@property (nonatomic, copy)      NSString * commentId;
@property (nonatomic, strong)    NSDictionary * contentDict;

@end
