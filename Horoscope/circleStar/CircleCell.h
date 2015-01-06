//
//  CircleCell.h
//  Horoscope
//
//  Created by Satellite on 15/1/5.
//
//

#import <UIKit/UIKit.h>
#import "EGOImageButton.h"
#import "EGOImageView.h"
#import "CircleBtn.h"
@interface CircleCell : UITableViewCell
@property(nonatomic,strong)EGOImageButton *headImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel * nameLabel;
@property (nonatomic,strong)UILabel * contentLabel;
@property (nonatomic,strong)EGOImageView * cImageView;
@property (nonatomic,strong)UILabel  * timeLabel;
@property (nonatomic,strong)UIButton * menuBtn;
@property (nonatomic,strong)CircleBtn * zanBtn;
@property (nonatomic,strong)CircleBtn *commBtn;
@property (nonatomic,strong)UIImageView *zanView;
@property (nonatomic,strong)UIImageView * commentView;

-(void)buildZanViewWithdic:(NSDictionary *)dic;//有赞的时候 创建此view
-(void)buildCommentViewWithDic:(NSArray *)arr;
@end
