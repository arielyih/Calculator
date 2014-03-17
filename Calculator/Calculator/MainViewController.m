//
//  MainViewController.m
//  Calculator
//
//  Created by ArielYih on 2014/3/10.
//  Copyright (c) 2014年 ArielYih. All rights reserved.
//

#import "MainViewController.h"


//@interface MainViewController ()
//
//
//@end

@implementation MainViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    resultLable.textAlignment = NSTextAlignmentRight;
    theFirstNumber = theSecondNumber = theOperand = theTempResult = @"";
}

-(IBAction) tapButton:(id)sender
{
    if ([theOperand isEqualToString:@""] && [theFirstNumber isEqualToString:@""])
    {
        if ( [sender isEqual:number1Button])
            theFirstNumber = [theFirstNumber stringByAppendingString:@"1"];
        
        else if ( [ sender isEqual:number2Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"2"];
        
        else if ( [ sender isEqual:number3Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"3"];
        
        else if ( [ sender isEqual:number4Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"4"];
        
        else if ( [ sender isEqual:number5Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"5"];
        
        else if ( [ sender isEqual:number6Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"6"];
        
        else if ( [ sender isEqual:number7Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"7"];
        
        else if ( [ sender isEqual:number8Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"8"];
        
        else if ( [ sender isEqual:number9Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"9"];
        
        else if ( [ sender isEqual:number0Button])
            theFirstNumber = [ theFirstNumber stringByAppendingString:@"0"];
        
        else if ([sender isEqual:pointButton])
        {
            if ([theFirstNumber rangeOfString:@"."].location == NSNotFound)
                theFirstNumber = [theFirstNumber stringByAppendingString:@"."];
            else
                return;
        }
        
        resultLable.text = theFirstNumber;
    }
    else
    {
        if ( [sender isEqual:number1Button])
            theSecondNumber = [theSecondNumber stringByAppendingString:@"1"];
        
        else if ( [ sender isEqual:number2Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"2"];
        
        else if ( [ sender isEqual:number3Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"3"];
        
        else if ( [ sender isEqual:number4Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"4"];
        
        else if ( [ sender isEqual:number5Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"5"];
        
        else if ( [ sender isEqual:number6Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"6"];
        
        else if ( [ sender isEqual:number7Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"7"];
        
        else if ( [ sender isEqual:number8Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"8"];
        
        else if ( [ sender isEqual:number9Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"9"];
        
        else if ( [ sender isEqual:number0Button])
            theSecondNumber = [ theSecondNumber stringByAppendingString:@"0"];
        
        else if ([sender isEqual:pointButton])
        {
            if ([theSecondNumber rangeOfString:@"."].location == NSNotFound)
                theSecondNumber = [theSecondNumber stringByAppendingString:@"."];
            else
                return;
        }
        
        resultLable.text = theSecondNumber;
    }
}

-(IBAction)tapCalculateButton:(id)sender
{
    NSDecimalNumber *inputFirstNumber = [NSDecimalNumber decimalNumberWithString:theFirstNumber];
    NSDecimalNumber *inputSecondNumber = [NSDecimalNumber decimalNumberWithString:theSecondNumber];
    NSDecimalNumber *calculateResultNumber = [NSDecimalNumber decimalNumberWithString:@""];
    if ([sender isEqual:return_zeroButton])
    {
        theFirstNumber = theSecondNumber = theOperand = @"";
    }
    if (![theTempResult isEqualToString:@""])
    {
        theFirstNumber = theTempResult;
        theTempResult = @"";
        if (![sender isEqual:equalButton])
        {
            if ([sender isEqual:plusButton])
            {
                theOperand = @"+";
            }
            else if ([sender isEqual:minusButton])
            {
                theOperand = @"-";
            }
            else if ([sender isEqual:mutiplyButton])
            {
                theOperand = @"x";
            }
            else if ([sender isEqual:divideButton])
            {
                theOperand = @"/";
            }
            resultLable.text = theFirstNumber;
        }
        else
        {
            resultLable.text = theFirstNumber;
        }
    }
    else
    {
        if ([theSecondNumber isEqualToString:@""])
        {
            if (![sender isEqual:equalButton])
            {
                if ([sender isEqual:plusButton])
                {
                    theOperand = @"+";
                }
                else if ([sender isEqual:minusButton])
                {
                    theOperand = @"-";
                }
                else if ([sender isEqual:mutiplyButton])
                {
                    theOperand = @"x";
                }
                else if ([sender isEqual:divideButton])
                {
                    theOperand = @"/";
                }
                resultLable.text = theFirstNumber;
            }
            else
            {
                resultLable.text = theFirstNumber;
            }
        }
        else
        {
            if (![sender isEqual:equalButton])
            {
                if ([theOperand isEqualToString:@"+"])
                {
                    calculateResultNumber = [inputFirstNumber decimalNumberByAdding:inputSecondNumber];
                }
                else if ([theOperand isEqualToString:@"-"])
                {
                    calculateResultNumber = [inputFirstNumber decimalNumberBySubtracting:inputSecondNumber];
                }
                else if ([theOperand isEqualToString:@"x"])
                {
                    calculateResultNumber = [inputFirstNumber decimalNumberByMultiplyingBy:inputSecondNumber];
                }
                else if ([theOperand isEqualToString:@"/"])
                {
                    if ([theSecondNumber isEqualToString:@"0"])
                    {
                        calculateResultNumber = nil;
                    }
                    else
                        calculateResultNumber = [inputFirstNumber decimalNumberByDividingBy:inputSecondNumber];
                }
                theFirstNumber = calculateResultNumber.stringValue;
                resultLable.text = theFirstNumber;
                theSecondNumber = @"";
                UIButton *buttonSender = (UIButton *) sender;
                theOperand = buttonSender.titleLabel.text;
            }
            else
            {
                if ([theOperand isEqualToString:@"+"])
                {
                    calculateResultNumber = [inputFirstNumber decimalNumberByAdding:inputSecondNumber];
                }
                else if ([theOperand isEqualToString:@"-"])
                {
                    calculateResultNumber = [inputFirstNumber decimalNumberBySubtracting:inputSecondNumber];
                }
                else if ([theOperand isEqualToString:@"x"])
                {
                    calculateResultNumber = [inputFirstNumber decimalNumberByMultiplyingBy:inputSecondNumber];
                }
                else if ([theOperand isEqualToString:@"/"])
                {
                    if ([theSecondNumber isEqualToString:@"0"])
                    {
                        calculateResultNumber = nil;
                    }
                    else
                        calculateResultNumber = [inputFirstNumber decimalNumberByDividingBy:inputSecondNumber];
                }
                theTempResult = calculateResultNumber.stringValue;
                resultLable.text = theTempResult;
                theFirstNumber = theSecondNumber = theOperand = @"";
            }
        }
    }
}
@end
