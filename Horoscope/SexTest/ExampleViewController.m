//
//  ExampleViewController.m
//  Horoscope
//
//  Created by SAT on 15/1/4.
//
//

#import "ExampleViewController.h"
#import "MBButtonShowView.h"

#define LOGRECT(f) NSLog(@"\nx:%f\ny:%f\nwidth:%f\nheight:%f\n",f.origin.x,f.origin.y,f.size.width,f.size.height)


@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTopViewWithTitle:@"爱情测试" withBackButton:YES];
//    [_contentSrollView setFrame:CGRectMake(0,0 ,320 ,500 )];
    
    [self reloadDatas];
    
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated{
    
    self.contentSrollView.frame = CGRectMake(0, 260, KScreenHeight, 300);
    self.contentSrollView.scrollEnabled = YES;
    [self.contentSrollView setContentSize:CGSizeMake(320, 1000)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadDatas
{
    
    _exampleArray =[NSMutableArray array];
    
    
    [_exampleArray addObject:[_exampleDic objectForKey:@"contentA"]];
    
    [_exampleArray addObject:[_exampleDic objectForKey:@"contentB"]];
    
    [_exampleArray addObject:[_exampleDic objectForKey:@"contentC"]];
    
    [_exampleArray addObject:[_exampleDic objectForKey:@"contentD"]];
    
    
    _answerArray =[NSMutableArray array];
    
    [_answerArray addObject:[_exampleDic objectForKey:@"answerA"]];
    
    [_answerArray addObject:[_exampleDic objectForKey:@"answerB"]];
    
    [_answerArray addObject:[_exampleDic objectForKey:@"answerC"]];
    
    [_answerArray addObject:[_exampleDic objectForKey:@"answerD"]];
    
    
    
    
    if (_exampleArray.count >0)
        
    {
        
        
        //        NSTextContainer * textCon=[NSTextContainer alloc]increaseSize:<#(id)#>
        
        _exampleTitle =[[UITextView alloc]initWithFrame:CGRectMake(20, 5, KScreenWidth-40, 200)];
//        
//        _exampleTitle.userInteractionEnabled=NO;
        
        _exampleTitle.scrollEnabled = YES;
        
        _exampleTitle.text =[_exampleDic valueForKey:@"title"];
        //        [_exampleTitle sizeToFit];
        
        [_exampleTitle setFont:[UIFont fontWithName:@"AppleGothic" size:17]];
        
        [self.contentSrollView addSubview:_exampleTitle];
        
        CGFloat height;
        
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
            
            CGRect textFrame=[[_exampleTitle layoutManager]usedRectForTextContainer:[_exampleTitle textContainer]];
            height = textFrame.size.height+10;
            
        }else {
            
            height = _exampleTitle.contentSize.height+10;
        }
        
        for (int i =0; i <_exampleArray.count; i++) {
            
            
            
            
            QRadioButton *buttons = [[QRadioButton alloc] initWithDelegate:self groupId:@"example"];
            buttons.frame = CGRectMake(_exampleTitle.frame.origin.x,height+30*i, KScreenWidth, 30);
            [buttons setTitle:[_exampleArray objectAtIndex:i] forState:UIControlStateNormal];
            [buttons setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [buttons.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
            [buttons setTitleColor:[UIColor colorWithRed:0/255.0f green:191/255.0f blue:255/255.0f alpha:1] forState:UIControlStateSelected];
            
            
            [_contentSrollView addSubview:buttons];
            

            
            if (i ==_exampleArray.count -1) {
                
                _submitButton =[UIButton buttonWithType:UIButtonTypeCustom];
                [_submitButton addTarget:self action:@selector(submitExamle:) forControlEvents:UIControlEventTouchUpInside];
                
                [_submitButton setFrame:CGRectMake(KScreenWidth/2-50, buttons.frame.origin.y +60, 100, 50)];
                [_submitButton setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
                
                //                 _submitButton.enabled =NO;
                [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
                
                [_submitButton setEnabled:NO];
                
                [_contentSrollView addSubview:_submitButton];
                
                [_contentSrollView setContentSize:CGSizeMake(KScreenWidth, _submitButton.bounds.origin.y+500)];
                
            }
            
        }
        
    }
    
}
#pragma mark - QRadioButtonDelegate
//选择试题后
- (void)didSelectedRadioButton:(QRadioButton *)radio groupId:(NSString *)groupId {
    NSLog(@"did selected radio:%@ groupId:%@", radio.titleLabel.text, groupId);
    
    [_submitButton setEnabled:YES];
    if (_exampleArray.count >0)
    {
        _selectedNum =[_exampleArray indexOfObject:radio.titleLabel.text];
        
        
    }
    
    
}

-(void)submitExamle:(UIButton *)btn

{
    
    [_contentSrollView setHidden:YES];
    
    //    _answerArray
    //    if (_answerArray.count>0) {
    if (1) {
        
        _answerScrolllView =[[UIScrollView alloc]init];
        
        _answerScrolllView.frame =_contentSrollView.frame;
        
//        NSLog(@"--------------%@",_contentSrollView.frame);
//        LOGRECT(_contentSrollView.frame);
        _answerScrolllView.scrollEnabled = YES;
        
        //        CGRect f =_answerScrolllView.frame;
        
        //        [_answerScrolllView setBackgroundColor:[UIColor redColor]];
        
        _answerText =[[UITextView alloc]initWithFrame:CGRectMake(20, 5, KScreenWidth-40, 600)];
        //              [self.view bringSubviewToFront:_answerText]
        
        //               NSString * strsdfds=[_answerArray objectAtIndex:_selectedNum];
        _answerText.text =[_answerArray objectAtIndex:_selectedNum];
        
        [_answerText setFont:[UIFont boldSystemFontOfSize:18.0f]];
        
        //                [_answerText setFont:[UIFont fontWithName:@"AppleGothic" size:17]];
        //               [_answerText setBackgroundColor:[UIColor redColor]];
        
//        _answerText.userInteractionEnabled=NO;
        
        [_answerScrolllView addSubview:_answerText];

        
        
        
        
        UITextView * anoterAnswer =[[UITextView alloc]initWithFrame:CGRectMake(20, 5, KScreenWidth-40, 300)];
        //              [self.view bringSubviewToFront:_answerText]
        
        //               NSString * strsdfds=[_answerArray objectAtIndex:_selectedNum];
        //               anoterAnswer.text =[_answerArray objectAtIndex:_selectedNum];
        
        [anoterAnswer setFont:[UIFont boldSystemFontOfSize:18.0f]];
        
        
        NSMutableString * otherAnswerStr =[NSMutableString string];
        
        for (int i =0; i<_answerArray.count; i++) {
            
            if (i != _selectedNum) {
                
                
                NSString  * change =[NSString stringWithFormat:@"%@ \n",_answerArray[i]];
                [otherAnswerStr appendString:change];
                
                
                
                
            }
            
            
        }
        anoterAnswer.text =otherAnswerStr;
        
        //显示更过
        CGFloat height =  [self getContenSizeAction:_answerText];
        _showOtherButton =[[MBButtonShowView alloc]initWithFrame:CGRectMake(KScreenWidth/2-50, height+60, 100, 50) showTextView:anoterAnswer Title:nil WithTarget:self];
        
        //            [_showOtherButton setFrame:CGRectMake(KScreenWidth/2-50, height+20, 100, 50)];
        [_showOtherButton setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
        
        //                 _submitButton.enabled =NO;
        [_showOtherButton setTitle:@"其他结果" forState:UIControlStateNormal];
        
        [_answerScrolllView addSubview:_showOtherButton];
        
        [_answerScrolllView setContentSize:CGSizeMake(KScreenWidth, _showOtherButton.bounds.origin.y+500)];
        
        
        
        
        
        
        [self.view addSubview:_answerScrolllView];
        
    }
    
    
    
}
//显示其他界面

- (void)showMoreView:(UIButton *)btn
{
    
    
    
    
}

//选择提交按钮后
-(void)selectExample:(UIButton * )btn
{
    
    _submitButton.enabled =YES;
    RadioButton * rdButton = (RadioButton *)[self.view viewWithTag:btn.tag-2000+2100];
    
    btn.selected =YES;
    [rdButton setChecked:YES];
    
    for (int i=0; i<_exampleArray.count; i++)
    {
        
        if (btn.tag != 2000+i) {
            
            UIButton * tagButton =(UIButton *)[self.view viewWithTag:2000+i];
            tagButton.selected =NO;
        }
        
    }
    
    [RadioButton buttonSelected:rdButton ];
    
    
    
}
//动态获取textView的高度
- (CGFloat)getContenSizeAction:(UITextView *)textView
{
    
    
    CGFloat height;
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        
        
        
        CGRect textFrame=[[textView layoutManager]usedRectForTextContainer:[textView textContainer]];
        
        height = textFrame.size.height;
        
        
        
    }else {
        
        
        
        height = textView.contentSize.height;
        
    }
    
    return height;
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
