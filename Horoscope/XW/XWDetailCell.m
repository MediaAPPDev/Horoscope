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
    
        self.titleName = [[UILabel alloc]initWithFrame:CGRectMake(28, 20, KScreenWidth-56, 30)];
        self.titleName.textColor  = UIColorFromRGBA(0x1bb5f5, 1);
        self.titleName.backgroundColor = [UIColor clearColor];
        self.titleName.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.titleName];
            
            
            
        self.timeLb = [[UILabel alloc] initWithFrame:CGRectMake(28, 50, 300, 30)];
        self.timeLb.text = @"11月20日 16:23";
        self.timeLb.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.timeLb];

        self.contentTV = [[UITextView alloc]initWithFrame:CGRectMake(14, 60, KScreenWidth-30, 50)];
        self.contentTV.scrollEnabled = NO;
        self.contentTV.backgroundColor = [UIColor clearColor];
        //        [self.newsText setNumberOfLines:0];
        self.contentTV.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.contentTV];
    
    

        self.commTfBackImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_03"]];
        [self.commTfBackImageView setFrame:CGRectMake(0, KScreenHeight-30, KScreenWidth, 30)];
        [self addSubview:self.commTfBackImageView];
        
        
        self.commTF = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, KScreenWidth-50, 30)];
        self.commTF.placeholder = @"我也来说一句";
        [self.commTfBackImageView addSubview:self.commTF];
        
        
        self.commSendButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth-50, 5,50 , 20)];
        [self.commSendButton setBackgroundImage:[UIImage imageNamed:@"Send-click@2x"] forState:UIControlStateNormal];
        [self.commTfBackImageView addSubview:self.commSendButton];
        
        
        
    
//    self.newsPic = [[EGOImageView alloc]initWithFrame:CGRectMake(14, 220, KScreenWidth-28, 50)];
//    [self addSubview:self.newsPic];
        
    
    
    
    
    
    
    
    
    
     }
     return self;
}
@end
