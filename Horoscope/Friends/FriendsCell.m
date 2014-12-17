//
//  FriendsCell.m
//  Horoscope
//
//  Created by Satellite on 14/12/17.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "FriendsCell.h"

@implementation FriendsCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.headimgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 15, 60, 60)];
        [self addSubview:self.headimgView];
        
        
        self.nameLb = [[UILabel alloc]initWithFrame:CGRectMake(sx(self.headimgView)+10, 15, 200, 20)];
        self.nameLb.textColor = [UIColor blackColor];
        self.nameLb.font = [UIFont boldSystemFontOfSize:17];
        [self addSubview:self.nameLb];
        
        self.starImgView = [[UIImageView alloc]initWithFrame:CGRectMake(sx(self.headimgView)+10, sy(self.nameLb)+3, 20, 20)];
        [self addSubview:self.starImgView];

        self.starLb =[[UILabel alloc]initWithFrame:CGRectMake(sx(self.starImgView)+10, sy(self.nameLb)+3, 150, 20)];
        self.starLb.textColor = [UIColor grayColor];
        self.starLb.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.starLb];
        
        self.signatureLb =[[UILabel alloc]initWithFrame:CGRectMake(sx(self.headimgView)+10, sy(self.starLb), 200, 20)];
        self.signatureLb.textColor = [UIColor grayColor];
        self.signatureLb.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.signatureLb];

        self.timeLabel =[[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth-80, 20, 70, 20)];
        self.timeLabel.textColor = [UIColor grayColor];
        self.timeLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.timeLabel];
        
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
