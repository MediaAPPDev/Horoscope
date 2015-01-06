//
//  ExampleViewController.m
//  Horoscope
//
//  Created by SAT on 15/1/4.
//
//

#import "ExampleViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self setTopViewWithTitle:@"爱情测试" withBackButton:YES];

    
    [self reloadDatas];
    
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated{
    
//    self.scrollView.frame = CGRectMake(0, 0, 320, 480);
    
 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadDatas
{
    
    if (_exampleArray.count >0)
        
    {
        

//        NSTextContainer * textCon=[NSTextContainer alloc]increaseSize:<#(id)#>
    
        _exampleTitle =[[UITextView alloc]initWithFrame:CGRectMake(30, 5, KScreenWidth-60, 300)];
        
        _exampleTitle.userInteractionEnabled=NO;
        
        _exampleTitle.text =@"我来个擦 dsdfdsfjdsajfoi";
//        [_exampleTitle sizeToFit];
        
        [_exampleTitle setFont:[UIFont fontWithName:@"AppleGothic" size:17]];
        
        [self.contentSrollView addSubview:_exampleTitle];
        
        CGFloat height;
        
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
            
            CGRect textFrame=[[_exampleTitle layoutManager]usedRectForTextContainer:[_exampleTitle textContainer]];
            height = textFrame.size.height;
            
        }else {
            
            height = _exampleTitle.contentSize.height;
        }
        
        for (int i =0; i <_exampleArray.count; i++) {
            RadioButton * button =[[RadioButton alloc ]initWithGroupId:@"example" index:i];
            
            UIButton * buttons =[[UIButton alloc]initWithFrame:CGRectMake(_exampleTitle.frame.origin.x+25,height+50+35*i, 220, 25)];
            
            [buttons setTitle:@"这个是问题1啊 和哈阿达撒" forState:UIControlStateNormal];
            
            [buttons setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            
//            #63B8FF
            [buttons setTitleColor:[UIColor colorWithRed:0/255.0f green:191/255.0f blue:255/255.0f alpha:1] forState:UIControlStateSelected];
            
            [buttons addTarget:self action:@selector(selectExample:) forControlEvents:UIControlEventTouchUpInside];
            [button setTag:2100+i];
            
            [buttons setTag:2000+i];
            [button setFrame:CGRectMake(_exampleTitle.frame.origin.x,height+50+35*i, 25, 25)];
        
            
             [RadioButton addObserverForGroupId:@"example" observer:self];
            
//            [button addTarget:self action:@selector(selectExample:) forControlEvents:UIControlEventTouchUpInside];
//            [button setBackgroundColor:[UIColor redColor]];
            [_contentSrollView addSubview:buttons];
            [_contentSrollView addSubview:button];
            
            if (i ==_exampleArray.count -1) {
                
            _submitButton =[UIButton buttonWithType:UIButtonTypeCustom];
                [_submitButton addTarget:self action:@selector(submitExamle:) forControlEvents:UIControlEventTouchUpInside];
                
                [_submitButton setFrame:CGRectMake(KScreenWidth/2-50, button.frame.origin.y +50, 100, 50)];
                [_submitButton setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
                
//                 _submitButton.enabled =NO;
                [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
                
                [_contentSrollView addSubview:_submitButton];
                
                [_contentSrollView setContentSize:CGSizeMake(KScreenWidth, _submitButton.bounds.origin.y+500)];
               
            }
            
        }
   
    }
    
}
//点击选择按钮
-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    NSLog(@"changed to %d in %@",index,groupId);
    
//    [_dic setObject:[NSString stringWithFormat:@"%d",index+1] forKey:groupId];
}

-(void)submitExamle:(UIButton *)btn

{
 
    
    
}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
