//
//  MainCollectionViewCell.m
//  Horoscope
//
//  Created by Satellite on 14/12/4.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        bgImageView.image = KUIImage(@"imgbg");
//        bgImageView.backgroundColor = [UIColor redColor];
        bgImageView.backgroundColor = UIColorFromRGBA(0x2f2f2f, 1);
        [self addSubview:bgImageView];
        
        self.MainImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width-10)];
        self.MainImageView.backgroundColor = [UIColor clearColor];
        self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width/3, frame.size.width/3)];
        [self addSubview:self.MainImageView];
        [self addSubview:self.leftImageView];
//        self.backgroundColor = [UIColor darkGrayColor];
        
        
        self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 20, 20)];
        self.numLabel.backgroundColor = [UIColor clearColor];
        self.numLabel.textAlignment = NSTextAlignmentCenter    ;
        self.numLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.numLabel];
        self.numLabel.textColor = [UIColor whiteColor];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, frame.size.width-10, frame.size.width-5, 25)];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.text = @"大风也无法撼动他";
        self.nameLabel.font = [UIFont boldSystemFontOfSize:12];
        [self addSubview:self.nameLabel];
        
    }
    return self;
}
@end
