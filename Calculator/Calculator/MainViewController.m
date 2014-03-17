//
//  MainViewController.m
//  Calculator
//
//  Created by ArielYih on 2014/3/10.
//  Copyright (c) 2014年 ArielYih. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    resultLable.textAlignment = NSTextAlignmentRight;
    theFirstNumber = theSecondNumber = theOperand = theTempResult = @"";
}

-(IBAction) tapButton:(id)sender
{
    UIButton *button = (UIButton *) sender;
    if ([theOperand isEqualToString:@""] && [theFirstNumber isEqualToString:@""])
    {
        theFirstNumber = [theFirstNumber stringByAppendingString:button.titleLabel.text];
        if ([button.titleLabel.text isEqualToString:@"."])
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
        theSecondNumber = [theSecondNumber stringByAppendingString:button.titleLabel.text];
        if ([button.titleLabel.text isEqualToString:@"."])
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
    if ([sender isEqual:return_zeroButton])
    {
        theFirstNumber = theSecondNumber = theOperand = theTempResult = @"";
        resultLable.text = theFirstNumber;
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
            NSDecimalNumber *inputFirstNumber = [NSDecimalNumber decimalNumberWithString:theFirstNumber];
            NSDecimalNumber *inputSecondNumber = [NSDecimalNumber decimalNumberWithString:theSecondNumber];
            NSDecimalNumber *calculateResultNumber = [NSDecimalNumber decimalNumberWithString:@""];
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
