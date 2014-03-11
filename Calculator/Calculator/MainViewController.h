//
//  MainViewController.h
//  Calculator
//
//  Created by ArielYih on 2014/3/10.
//  Copyright (c) 2014年 ArielYih. All rights reserved.
//



@interface MainViewController : UIViewController
{
    IBOutlet UILabel *resultLable;
    IBOutlet UIButton *return_zeroButton;
    IBOutlet UIButton *number1Button;
    IBOutlet UIButton *number2Button;
    IBOutlet UIButton *number3Button;
    IBOutlet UIButton *number4Button;
    IBOutlet UIButton *number5Button;
    IBOutlet UIButton *number6Button;
    IBOutlet UIButton *number7Button;
    IBOutlet UIButton *number8Button;
    IBOutlet UIButton *number9Button;
    IBOutlet UIButton *number0Button;
    IBOutlet UIButton *plusButton;
    IBOutlet UIButton *minusButton;
    IBOutlet UIButton *mutiplyButton;
    IBOutlet UIButton *divideButton;
    IBOutlet UIButton *equalButton;
    IBOutlet UIButton *pointButton;
    
    NSString *resultString;
    NSString *theFirstNumber;
    NSString *theSecondNumber;
    NSString *theTempNumber;
    NSString *theOperand;
    BOOL finishTheFirstNumber;   // 布林值   if (test == YES) 才會進入function
    BOOL finishTheOperand;
    BOOL finishTheSecondNumber;
}

-(IBAction)tapButton:(id)sender;
-(IBAction)tapCalculateButton:(id)sender;


@end
