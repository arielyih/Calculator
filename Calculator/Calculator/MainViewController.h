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
    IBOutlet UIButton *plusButton;
    IBOutlet UIButton *minusButton;
    IBOutlet UIButton *mutiplyButton;
    IBOutlet UIButton *divideButton;
    IBOutlet UIButton *equalButton;
    
    NSString *theFirstNumber;
    NSString *theSecondNumber;
    NSString *theOperand;
    NSString *theTempResult;
}

-(IBAction) tapButton:(id)sender;
-(IBAction) tapCalculateButton:(id)sender;

@end
