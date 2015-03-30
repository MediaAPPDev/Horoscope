//
//  XWCommentsVC.h
//  Horoscope
//
//  Created by qihonggang on 15-3-26.
//
//

#import "BaseViewController.h"
#import "XWCommentCell.h"
@interface XWCommentsVC : BaseViewController<UITableViewDataSource,UITableViewDelegate,commentCellDelegate>
@property (nonatomic, copy)NSString * commentId;
@end
