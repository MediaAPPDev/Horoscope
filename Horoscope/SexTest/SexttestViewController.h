//
//  testViewController.h
//  Horoscope
//
//  Created by SAT on 14/12/29.
//
//

#import "BaseViewController.h"


@interface SexttestViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    
    
    NSMutableArray *_imageNames;
    
//    BMAdScrollView *adView;
    
    BOOL isFromStart;
    NSInteger ImageHeight;
}

@property (nonatomic,strong)NSArray * allArray;

@property (weak, nonatomic) IBOutlet UITableView *testTableView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UIView *headView;

@property (weak, nonatomic) IBOutlet UIPageControl *testPageControler;
@property (weak, nonatomic) IBOutlet UIScrollView *topSrcollView;





@end
