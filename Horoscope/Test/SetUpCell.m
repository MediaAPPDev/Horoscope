//
//  SetUpCell.m
//  Horoscope
//
//  Created by Satellite on 14/12/18.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "SetUpCell.h"

@implementation SetUpCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 80, 40)];
        [self addSubview:self.titleLabel];
        
        if (self.isHaveImg) {
            for (int i = 0; i<4; i++) {
                UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(130+30*i, 5, 30, 30)];
                img.image = KUIImage(@"");
                [self addSubview:img];
            }
          }
        
        
        
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
