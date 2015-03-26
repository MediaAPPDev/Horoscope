//
//  XWCell.m
//  Horoscope
//
//  Created by Satellite on 15/1/26.
//
//

#import "XWCell.h"
  
@implementation XWCell

//- (void)awakeFromNib {
//    // Initialization code
//}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.facePic =[[EGOImageButton alloc]initWithFrame:CGRectMake(14, 6, 40, 40)];
        [self addSubview:self.facePic];
        
        self.titleName = [[UILabel alloc]initWithFrame:CGRectMake(70, 6, 200, 20)];
        self.titleName.textColor  = UIColorFromRGBA(0x1bb5f5, 1);
        self.titleName.backgroundColor = [UIColor clearColor];
        self.titleName.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.titleName];
        
        self.newsText = [[UITextView alloc]initWithFrame:CGRectMake(14, 60, KScreenWidth-28, 50)];
        self.newsText.scrollEnabled = NO;
        self.newsText.backgroundColor = [UIColor clearColor];
//        [self.newsText setNumberOfLines:0];
        self.newsText.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.newsText];
        
        self.newsPic = [[EGOImageView alloc]initWithFrame:CGRectMake(14, 220, KScreenWidth-28, 50)];
        [self addSubview:self.newsPic];
        
        
//        self.moreLb = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth-79, 96, 70, 30)];
//        self.moreLb.text = @"  ...显示更多";
//        [self.moreLb setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:10]];
//        [self addSubview:self.moreLb];
        
        
        
        
        
        //分享
//        self.share = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-100, sy(self.newsText)+10, 84, 28)];
        self.share = [[UIButton alloc]initWithFrame:CGRectMake(74, sy(self.newsText)+10, 30, 28)];
        [self.share setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.share setBackgroundImage:KUIImage(@"share") forState:UIControlStateNormal];
        [self.share addTarget:self action:@selector(shareToThirdPage:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.share];
//        self.share.hidden = YES;
        //分享数;;;;;
        self.shareNumLb =[[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth-100, sy(self.newsText)+10, 84, 28)];
        //        [self.commLb setBackgroundImage:KUIImage(@"pinglun-Normal") forState:UIControlStateNormal];
        //        self.commLb.titleLabel.textAlignment = NSTextAlignmentRight;
        //        [self.commLb addTarget:self action:@selector(didClikcComm:) forControlEvents:UIControlEventTouchUpInside];
        self.shareNumLb.text = @"20";
        [self addSubview:self.shareNumLb];
        
        
        
        
        
        
        //赞
        self.zanBtn = [[UIButton alloc] initWithFrame:CGRectMake(14, sy(self.newsText)+10, 30, 28)];
        [self.zanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.zanBtn setBackgroundImage:KUIImage(@"zan-Normal") forState:UIControlStateNormal];
        [self.zanBtn addTarget:self action:@selector(didClickZan:) forControlEvents:UIControlEventTouchUpInside];
//        self.zanBtn.backgroundColor = [UIColor cyanColor];
//        self.zanBtn.titleLabel.textAlignment = NSTextAlignmentRight;
//        self.zanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.zanBtn];
        
        
        
        
        
        //赞数
        self.zanNumLb =[[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth-100, sy(self.newsText)+10, 84, 28)];
        //        [self.commLb setBackgroundImage:KUIImage(@"pinglun-Normal") forState:UIControlStateNormal];
        //        self.commLb.titleLabel.textAlignment = NSTextAlignmentRight;
        //        [self.commLb addTarget:self action:@selector(didClikcComm:) forControlEvents:UIControlEventTouchUpInside];
        self.zanNumLb.text = @"30";
        [self addSubview:self.zanNumLb];
        
        
        
        
        
        //评论
        self.commLb =[[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth-100, sy(self.newsText)+10, 84, 28)];
//        [self.commLb setBackgroundImage:KUIImage(@"pinglun-Normal") forState:UIControlStateNormal];
//        self.commLb.titleLabel.textAlignment = NSTextAlignmentRight;
//        [self.commLb addTarget:self action:@selector(didClikcComm:) forControlEvents:UIControlEventTouchUpInside];
        self.commLb.text = @"评论";
        [self addSubview:self.commLb];
        
        
        
        //评论数
        self.commNumLb =[[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth-184, sy(self.newsText)+10, 84, 28)];
        //        [self.commLb setBackgroundImage:KUIImage(@"pinglun-Normal") forState:UIControlStateNormal];
        //        self.commLb.titleLabel.textAlignment = NSTextAlignmentRight;
        //        [self.commLb addTarget:self action:@selector(didClikcComm:) forControlEvents:UIControlEventTouchUpInside];
        self.commNumLb.text = @"20";
        [self addSubview:self.commNumLb];

        
    }
    return self;
}

-(void)didClickZan:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didClickZanWithCell:)]) {
        [self.delegate didClickZanWithCell:self];
    }
}
-(void)shareToThirdPage:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(didClickShareWithCell:)]) {
        [self.delegate didClickShareWithCell:self];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
// replacementText:(NSString *)text {
//    /*错误更正
//     
//     textView.text = [NSString stringWithFormat:@"%@%@", textView.text, text];
//     
//     */
//    if (textView.contentSize.height > 50) {
//        textView.text = [textView.text substringToIndex:[textView.text length]-1];
//        return NO;
//    }
//    
//    /*错误更正
//     
//     if([textView.text length]>0) {
//     textView.text = [textView.text substringToIndex:[textView.text length]-1];
//     
//     }
//     
//     */
//    return YES;
//}

@end
