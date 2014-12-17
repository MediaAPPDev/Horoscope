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
{
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        
        _cell1 = [self buildButtonWithFrame:CGRectMake(1, 0, self.bounds.size.width/3-4, self.bounds.size.width/3+15) image:@"1.jpg" tag:101 text:@"2"];
        
        _cell2 = [self buildButtonWithFrame:CGRectMake( self.bounds.size.width/3+1, 0, self.bounds.size.width/3-4, self.bounds.size.width/3+15) image:@"1.jpg" tag:102 text:@"3"];
        
        
        _cell3 = [self buildButtonWithFrame:CGRectMake( self.bounds.size.width/3*2+2, 0, self.bounds.size.width/3-3, self.bounds.size.width/3+15) image:@"1.jpg" tag:103 text:@"4"];
        
        
        _cell4 = [self buildButtonWithFrame:CGRectMake(1,  self.bounds.size.width/3+18, self.bounds.size.width/3-4, self.bounds.size.width/3+15) image:@"1.jpg" tag:104 text:@"5"];
        
        
        _cell5 = [self buildButtonWithFrame:CGRectMake(1,  self.bounds.size.width/3*2+36, self.bounds.size.width/3-4, self.bounds.size.width/3+15) image:@"1.jpg" tag:105 text:@"6"];
        
        
        _cell6 = [self buildButtonWithFrame:CGRectMake(self.bounds.size.width/3+1, self.bounds.size.width/3+18, self.bounds.size.width/3*2-2, self.bounds.size.width/3*2+33) image:@"1.jpg" tag:100 text:@"1"];
        
  
        _cell6.MainImageView.frame = CGRectMake(0, 0, self.bounds.size.width/3*2-2, self.bounds.size.width/3*2);
        
        _cell6.nameLabel.frame = CGRectMake(3, self.bounds.size.width/3*2, self.bounds.size.width/3*2, 30);
        _cell6.leftImageView.image = KUIImage(@"排名色块大");
        _cell6.numLabel.frame = CGRectMake(20, 20, 20, 20);
        _cell6.numLabel.font = [UIFont boldSystemFontOfSize:20];
        
        [self addSubview:_cell1];
        [self addSubview:_cell2];
        [self addSubview:_cell3];
        [self addSubview:_cell4];
        [self addSubview:_cell5];
        [self addSubview:_cell6];
  
    }
    return self;
}
#pragma mark 表头


-(TopButton *)buildButtonWithFrame:(CGRect)frame image:(NSString *)image tag:(int)tag text:(NSString *)text
{
    TopButton *cell1 = [[TopButton alloc]initWithFrame:frame];
    cell1.layer.masksToBounds = YES;
    cell1.layer.cornerRadius = 6.0;
    cell1.layer.borderWidth = 1.0;
    
    cell1.MainImageView.image = KUIImage(image);
    cell1.leftImageView.image = KUIImage(@"排名色块小");
    cell1.numLabel.text = text;
    [cell1 addTarget:self action:@selector(didclickNoto:) forControlEvents:UIControlEventTouchUpInside];

    return cell1;
}
-(void)didclickNoto:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"didClick_wx_drx" object:@(sender.tag)];
}
@end
