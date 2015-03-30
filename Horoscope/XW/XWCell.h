//
//  XWCell.h
//  Horoscope
//
//  Created by Satellite on 15/1/26.
//
//

#import <UIKit/UIKit.h>
#import "EGOImageButton.h"
#import "EGOImageView.h"
#import "CircleBtn.h"


@protocol UITextViewDelegate;
@protocol XwCellDelegate;
@interface XWCell : UITableViewCell
@property (strong, nonatomic)  UIButton *share;
@property (strong, nonatomic)  UILabel *shareNumLb;
@property (strong, nonatomic)  EGOImageButton *facePic;
@property (strong, nonatomic)  UILabel *titleName;
@property (strong, nonatomic)  UILabel *newsTime;
@property (strong, nonatomic)  UITextView *newsText;
//@property (strong, nonatomic)  UILabel *moreLb;
@property (strong, nonatomic)  EGOImageView *newsPic;
@property (nonatomic,assign) id<XwCellDelegate>delegate;
@property (nonatomic,strong)UIButton * zanBtn;
@property (nonatomic,strong)UILabel * zanNumLb;
@property (nonatomic,strong)UILabel *commLb;
@property (nonatomic,strong)UILabel *commNumLb;
@property (nonatomic,strong)UILabel *subtitle;
@end

@protocol XwCellDelegate <NSObject>

-(void)didClickShareWithCell:(XWCell *)cell;
-(void)didClickZanWithCell:(XWCell *)cell;

@end

@protocol textDelegate <NSObject>

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text;

@end
