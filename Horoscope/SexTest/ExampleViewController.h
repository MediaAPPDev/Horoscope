//
//  ExampleViewController.h
//  Horoscope
//
//  Created by SAT on 15/1/4.
//
//

#import "BaseViewController.h"
#import "RadioButton.h"
@interface ExampleViewController : BaseViewController<RadioButtonDelegate>

@property (nonatomic,strong)NSMutableArray * exampleArray;


@property (weak, nonatomic) IBOutlet UILabel *testCount;
@property (weak, nonatomic) IBOutlet UILabel *zhunLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UITextView *textTitle;
@property (weak, nonatomic) IBOutlet UIView *headViews;

@property (weak, nonatomic) IBOutlet UIScrollView *contentSrollView;
@property (nonatomic,strong)UIButton * submitButton;

@property (nonatomic,strong)UITextView * exampleTitle;

@end
