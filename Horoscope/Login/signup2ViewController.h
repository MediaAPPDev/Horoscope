//
//  signup2ViewController.h
//  Horoscope
//
//  Created by SAT on 15/1/9.
//
//

#import "BaseViewController.h"

@interface signup2ViewController : BaseViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *telPhoneNumber;

@property (weak, nonatomic) IBOutlet UITextField *sendCode;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (nonatomic,strong)NSMutableString * telNum;
@property (weak, nonatomic) IBOutlet UIButton *resenVerificationCode;





@end
