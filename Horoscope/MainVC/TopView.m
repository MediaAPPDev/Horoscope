//
//  TopView.m
//  Horoscope
//
//  Created by Satellite on 14/12/8.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "TopView.h"
#import "MainCollectionViewCell.h"
@implementation TopView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        MainCollectionViewCell *cell1 = [[MainCollectionViewCell alloc]
                                         initWithFrame:
                                         CGRectMake(1, 0, self.bounds.size.width/3-4, self.bounds.size.width/3+15)];
        
         MainCollectionViewCell *cell2 = [[MainCollectionViewCell alloc]
                                          initWithFrame:
                                          CGRectMake( self.bounds.size.width/3+1, 0, self.bounds.size.width/3-4, self.bounds.size.width/3+15)];
        
        
         MainCollectionViewCell *cell3 = [[MainCollectionViewCell alloc]
                                          initWithFrame:
                                          CGRectMake( self.bounds.size.width/3*2+2, 0, self.bounds.size.width/3-3, self.bounds.size.width/3+15)];
        
        
         MainCollectionViewCell *cell4 = [[MainCollectionViewCell alloc]
                                          initWithFrame:
                                          CGRectMake(1,  self.bounds.size.width/3+18, self.bounds.size.width/3-4, self.bounds.size.width/3+15)];
        
        
         MainCollectionViewCell *cell5 = [[MainCollectionViewCell alloc]
                                          initWithFrame:
                                          CGRectMake(1,  self.bounds.size.width/3*2+36, self.bounds.size.width/3-4, self.bounds.size.width/3+15)];
        
        MainCollectionViewCell *cell6 = [[MainCollectionViewCell alloc]
                                         initWithFrame:
                                         CGRectMake(self.bounds.size.width/3+1, self.bounds.size.width/3+18, self.bounds.size.width/3*2-2, self.bounds.size.width/3*2+33)];
        cell6.MainImageView.frame = CGRectMake(0, 0, self.bounds.size.width/3*2-2, self.bounds.size.width/3*2+5);
        cell6.nameLabel.frame = CGRectMake(3, self.bounds.size.width/3*2+5, self.bounds.size.width/3*2, 25);
        cell6.numLabel.frame = CGRectMake(20, 20, 20, 20);
        cell6.numLabel.font = [UIFont boldSystemFontOfSize:20];
        cell1.layer.masksToBounds = YES;
        cell1.layer.cornerRadius = 6.0;
        cell1.layer.borderWidth = 1.0;

        cell2.layer.masksToBounds = YES;
        cell2.layer.cornerRadius = 6.0;
        cell2.layer.borderWidth = 1.0;
        
        cell3.layer.masksToBounds = YES;
        cell3.layer.cornerRadius = 6.0;
        cell3.layer.borderWidth = 1.0;
        
        cell4.layer.masksToBounds = YES;
        cell4.layer.cornerRadius = 6.0;
        cell4.layer.borderWidth = 1.0;
        
        cell5.layer.masksToBounds = YES;
        cell5.layer.cornerRadius = 6.0;
        cell5.layer.borderWidth = 1.0;
        
        cell6.layer.masksToBounds = YES;
        cell6.layer.cornerRadius = 6.0;
        cell6.layer.borderWidth = 1.0;
        
        cell1.MainImageView.image = KUIImage(@"1.jpg");
        cell2.MainImageView.image = KUIImage(@"1.jpg");
        cell3.MainImageView.image = KUIImage(@"1.jpg");
        cell4.MainImageView.image = KUIImage(@"1.jpg");
        cell5.MainImageView.image = KUIImage(@"1.jpg");
        cell6.MainImageView.image = KUIImage(@"1.jpg");
        cell1.leftImageView.image = KUIImage(@"rank2");
        cell2.leftImageView.image = KUIImage(@"rank2");
        cell3.leftImageView.image = KUIImage(@"rank2");
        cell4.leftImageView.image = KUIImage(@"rank2");
        cell5.leftImageView.image = KUIImage(@"rank2");
        cell6.leftImageView.image = KUIImage(@"rank");

        cell1.numLabel.text = @"2";
        cell2.numLabel.text = @"3";
        cell3.numLabel.text = @"4";
        cell4.numLabel.text = @"5";
        cell5.numLabel.text = @"6";
        cell6.numLabel.text = @"1";
        
        [self addSubview:cell1];
        [self addSubview:cell2];
        [self addSubview:cell3];
        [self addSubview:cell4];
        [self addSubview:cell5];
        [self addSubview:cell6];
  
    }
    return self;
}
#pragma mark 表头


@end
