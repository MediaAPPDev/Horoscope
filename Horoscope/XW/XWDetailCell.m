//
//  XWDetailCell.m
//  Horoscope
//
//  Created by qihonggang on 15-3-24.
//
//

#import "XWDetailCell.h"

@implementation XWDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state

}



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
    self.titleName = [[UILabel alloc]initWithFrame:CGRectMake(70, 6, 200, 20)];
    self.titleName.textColor  = UIColorFromRGBA(0x1bb5f5, 1);
    self.titleName.backgroundColor = [UIColor clearColor];
    self.titleName.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.titleName];

    self.contentTV = [[UITextView alloc]initWithFrame:CGRectMake(14, 60, KScreenWidth-28, 50)];
    self.contentTV.scrollEnabled = NO;
    self.contentTV.backgroundColor = [UIColor clearColor];
    //        [self.newsText setNumberOfLines:0];
    self.contentTV.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.contentTV];
    
//    self.newsPic = [[EGOImageView alloc]initWithFrame:CGRectMake(14, 220, KScreenWidth-28, 50)];
//    [self addSubview:self.newsPic];
        
    
    
    
    
    
    
    
    
    
     }
     return self;
}
@end
