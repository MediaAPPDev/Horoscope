//
//  XWCommentCell.h
//  Horoscope
//
//  Created by Satellite on 15/3/27.
//
//

#import <UIKit/UIKit.h>
#import "EGOImageButton.h"

@protocol commentCellDelegate;

@interface XWCommentCell : UITableViewCell
@property (nonatomic, strong)UILabel * nickname;
@property (nonatomic, strong)UILabel * commentLabel;
@property (nonatomic, strong)UIButton * allBtnl;
@property (nonatomic, strong)EGOImageButton * headImgBtn;
@property (nonatomic, strong)UILabel * timeLabel;
@property (nonatomic, strong)UIButton * zanBtn;
@property (nonatomic, strong)UILabel  * zanLabel;
@property (nonatomic, assign)id<commentCellDelegate>delegate;
@end
@protocol commentCellDelegate <NSObject>

-(void)didClickZanWithCell:(XWCommentCell*)cell;

-(void)didClickHeadImgWithCell:(XWCommentCell*)cell;

-(void)didClickReplyWithCell:(XWCommentCell*)cell;
@end
