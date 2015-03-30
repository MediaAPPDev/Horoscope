//
//  XWCommentCell.m
//  Horoscope
//
//  Created by Satellite on 15/3/27.
//
//

#import "XWCommentCell.h"

@implementation XWCommentCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        self.headImgBtn = [[EGOImageButton alloc]initWithPlaceholderImage:KUIImage(@"placeholder")];
        self.headImgBtn.frame = CGRectMake(10, 10, 60, 60);
        self.headImgBtn.layer.masksToBounds = YES;
        self.headImgBtn.layer.cornerRadius = 30.0;
        self.headImgBtn.layer.borderWidth = 0.5;
        
        [self.headImgBtn addTarget:self action:@selector(getFirstFloor:) forControlEvents:UIControlEventTouchUpInside];
        self.headImgBtn.tag = self.tag;
        [self addSubview:self.headImgBtn];
        
        self.nickname = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 150, 30)];
        self.nickname.backgroundColor = [UIColor clearColor];
        self.nickname.textColor = UIColorFromRGBA(0x4986c1, 1);
        self.nickname.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:self.nickname];
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 40, 150, 15)];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.textColor = UIColorFromRGBA(0xa2a2a2, 1);
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.timeLabel];
        
        self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 60, KScreenWidth-100, 50)];
        self.commentLabel.backgroundColor = UIColorFromRGBA(0xf0f0f0, 1);
        self.commentLabel.numberOfLines = 3;
        self.commentLabel.textColor = UIColorFromRGBA(0x000000, 1);
        self.commentLabel.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:self.commentLabel];

        self.replyLable = [[UILabel alloc]initWithFrame:CGRectMake(80, 110, KScreenWidth-100, 50)];
        self.replyLable.backgroundColor = UIColorFromRGBA(0xf0f0f0, 1);
        self.replyLable.numberOfLines = 3;
        self.replyLable.textColor = UIColorFromRGBA(0x000000, 1);
        self.replyLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.replyLable];

        
        
        
        self.zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-90, 25, 80, 35)];
//        [self.zanBtn setTitle:@"202" forState:UIControlStateNormal];
        [self.zanBtn setBackgroundImage:KUIImage(@"button01-normal") forState:UIControlStateNormal];
        self.zanBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.zanBtn.tag = self.tag;
        [self.zanBtn addTarget:self action:@selector(getSecondFloor:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.zanBtn];
        
        self.zanLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 40, 35)];
        self.zanLabel.backgroundColor = [UIColor clearColor];
        self.zanLabel.text = @"11";
        self.zanLabel.adjustsFontSizeToFitWidth = YES;
        self.zanLabel.textAlignment = NSTextAlignmentCenter;
        self.zanLabel.textColor = UIColorFromRGBA(0x8b8b8b, 1);
        self.zanLabel.font = [UIFont systemFontOfSize:14];
        [self.zanBtn addSubview:self.zanLabel];
        
        
    }
    return self;
}
-(void)getFirstFloor:(UIButton *)sender
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didClickHeadImgWithCell:)]) {
        [self.delegate didClickHeadImgWithCell:self];
    }
}


-(void)getSecondFloor:(UIButton *)sender
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didClickZanWithCell:)]) {
        [self.delegate didClickZanWithCell:self];
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
