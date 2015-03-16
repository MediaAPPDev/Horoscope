//
//  PhotoViewController.m
//  Horoscope
//
//  Created by Satellite on 14/12/16.
//  Copyright (c) 2014年 施傲天. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()
{
    UILabel * numLb;
    EGOImageView *imageView;
    EGOImageView *saveImageView;

    UIScrollView *scr;
    UIButton *saveButton;
    UIActionSheet *actionSheet;
    UILongPressGestureRecognizer *longpress;
    int i;
}
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIScrollView *scrollView =[[ UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(KScreenWidth*self.photoArray.count, 0);
    scrollView.contentOffset = CGPointMake(KScreenWidth*self.num, 0);
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    
    
    
//    NSLog(@"------------%@",self.photoArray);
    

    
    
    
    for (i = 0; i<self.photoArray.count; i++) {
        
         scr= [[UIScrollView alloc]initWithFrame:CGRectMake(width(self.view)*i, 0, width(self.view), height(self.view))];
        
        imageView =[[EGOImageView alloc]initWithFrame:scr.frame];
        imageView.imageURL = [NSURL URLWithString:self.photoArray[i]];
        
        CGFloat imgW = imageView.image.size.width;
        CGFloat imgH = imageView.image.size.height;
        CGFloat imgViewWid ;
        CGFloat imgViewHie;
        
        //判断图片实际大小是否大于屏幕尺寸 如果大于则定其宽度等于屏幕宽度 等比缩放图片
        if (imgW>KScreenWidth) {
            imgViewWid = KScreenWidth;
            imgViewHie = KScreenWidth * imgH/imgW;
        }else{
            imgViewWid = imgW;
            imgViewHie = imgH;
        }
        imageView.frame = CGRectMake(0, 0, imgViewWid, imgViewHie);
        imageView.userInteractionEnabled = YES;
        imageView.center = CGPointMake(KScreenWidth/2, KScreenHeight/2);
        imageView.tag = 1000+i;

        
        [scr addSubview:imageView];

        [scr addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backView)]];
        scr.backgroundColor = [UIColor blackColor];
        [scrollView addSubview:scr];
    }
    
    
        numLb = [self buildLabelWithFrame:CGRectMake(width(self.view)-170, height(self.view)-60, 150, 50) backgroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:40] textAlignment:NSTextAlignmentRight text:[NSString stringWithFormat:@"%d/%lu",self.num+1,(unsigned long)self.photoArray.count]];
    [self.view addSubview:numLb];

    
    saveButton = [[UIButton alloc] initWithFrame:CGRectMake(20, height(self.view)-60, 50, 50)];
    if (imageView == nil) {
    [saveButton setBackgroundImage:[UIImage imageNamed:@"save_icon.png"] forState:UIControlStateNormal];
        saveButton.userInteractionEnabled = NO;
    }else{
    [saveButton setBackgroundImage:[UIImage imageNamed:@"save_icon_highlighted.png"] forState:UIControlStateNormal];
        saveButton.tag = self.num;
//        NSLog(@"%@",numLb.text);
//        NSLog(@"😄%d",saveButton.tag);
    }
    [saveButton addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    // Do any additional setup after loading the view.
    
}



-(void)saveAction:(UIButton *)sender
{

     actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"是否保存图片？"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                  otherButtonTitles:nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    actionSheet.tag = sender.tag;
//    NSLog(@"%ld",actionSheet.tag);
    [actionSheet showInView:self.view];

}

- (void) handleLongPressAction:(UILongPressGestureRecognizer*)press
{
    
}


#pragma mark - actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        imageView.image = nil;
//        NSLog(@"%ld",imageView.tag);
//        imageView =[[EGOImageView alloc]initWithFrame:scr.frame];

        imageView.imageURL = [NSURL URLWithString:self.photoArray[saveButton.tag]];
//        NSLog(@"%ld",saveButton.tag);
        UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
//    imageView.image = nil;
//    scr.userInteractionEnabled = YES;
}
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"需要访问相册权限";
    }else{
        msg = @"保存成功" ;
        
    }
    [self showMessageWindowWithContent:msg imageType:0];
}



-(void)backView
{
 [self.menuController popViewControllerAnimated:NO];
    
//     [self.menuController pushViewController:nav withTransitionAnimator:[MDTransitionAnimatorFactory transitionAnimatorWithType:MDAnimationTypeSlideFromRight]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int num = scrollView.contentOffset.x/width(self.view);
    int allnum = scrollView.contentSize.width/width(self.view);
    numLb.text = [NSString stringWithFormat:@"%d/%d",num+1,allnum];
    saveButton.tag = num;
//    NSLog(@"----------%d",saveButton.tag);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
