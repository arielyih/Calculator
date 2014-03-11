//
//  MainViewController.m
//  Calculator
//
//  Created by ArielYih on 2014/3/10.
//  Copyright (c) 2014年 ArielYih. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()


@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    resultLable.textAlignment = NSTextAlignmentRight;
    resultLable.textColor = [UIColor blackColor];
    [number1Button setTitle:@"1" forState:UIControlStateNormal];
    [number2Button setTitle:@"2" forState:UIControlStateNormal];
    [number3Button setTitle:@"3" forState:UIControlStateNormal];
    [number4Button setTitle:@"4" forState:UIControlStateNormal];
    [number5Button setTitle:@"5" forState:UIControlStateNormal];
    [number6Button setTitle:@"6" forState:UIControlStateNormal];
    [number7Button setTitle:@"7" forState:UIControlStateNormal];
    [number8Button setTitle:@"8" forState:UIControlStateNormal];
    [number9Button setTitle:@"9" forState:UIControlStateNormal];
    [number0Button setTitle:@"0" forState:UIControlStateNormal];
    [return_zeroButton setTitle:@"C" forState:UIControlStateNormal];
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    [minusButton setTitle:@"-" forState:UIControlStateNormal];
    [mutiplyButton setTitle:@"x" forState:UIControlStateNormal];
    [divideButton setTitle:@"/" forState:UIControlStateNormal];
    [equalButton setTitle:@"=" forState:UIControlStateNormal];
    [pointButton setTitle:@"." forState:UIControlStateNormal];
    resultString = theFirstNumber = theSecondNumber = theOperand = theTempNumber = @"";
}

-(IBAction)tapButton:(id)sender
{
    if ( [sender isEqual:number1Button])
        resultString = [resultString stringByAppendingString:@"1"];
    
    else if ( [ sender isEqual:number2Button])
        resultString = [ resultString stringByAppendingString:@"2"];
    
    else if ( [ sender isEqual:number3Button])
        resultString = [ resultString stringByAppendingString:@"3"];
    
    else if ( [ sender isEqual:number4Button])
        resultString = [ resultString stringByAppendingString:@"4"];
    
    else if ( [ sender isEqual:number5Button])
        resultString = [ resultString stringByAppendingString:@"5"];
    
    else if ( [ sender isEqual:number6Button])
        resultString = [ resultString stringByAppendingString:@"6"];
    
    else if ( [ sender isEqual:number7Button])
        resultString = [ resultString stringByAppendingString:@"7"];
    
    else if ( [ sender isEqual:number8Button])
        resultString = [ resultString stringByAppendingString:@"8"];
    
    else if ( [ sender isEqual:number9Button])
        resultString = [ resultString stringByAppendingString:@"9"];
    
    else if ( [ sender isEqual:number0Button])
        resultString = [ resultString stringByAppendingString:@"0"];
    
    else if ( [ sender isEqual:pointButton])
        resultString = [ resultString stringByAppendingString:@"."];
    
    resultLable.text = resultString;
}

-(IBAction)tapCalculateButton:(id)sender
{
    if ([theFirstNumber isEqualToString:@""] && [theOperand isEqualToString:@""])
    {
        theFirstNumber = resultString;
        theTempNumber = resultString;
        resultString = @"";
        if ([sender isEqual:plusButton])
        {
            theOperand = @"+";
            resultLable.text = theTempNumber;
        }
        else if ([sender isEqual:minusButton])
        {
            theOperand = @"-";
            resultLable.text = theTempNumber;
        }
        else if ([sender isEqual:mutiplyButton])
        {
            theOperand = @"x";
            resultLable.text = theTempNumber;
        }
        else if ([sender isEqual:divideButton])
        {
            theOperand = @"/";
            resultLable.text = theTempNumber;
        }
        [self tapButton:sender];
    }
    
    else if (![theFirstNumber isEqualToString:@""] && ![theOperand isEqualToString:@""])
    {
        theSecondNumber = resultString;
        theTempNumber = theSecondNumber;
        resultString = @"";
        if ([sender isEqual:plusButton])
        {
            if ([theOperand isEqualToString:@"+"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber + theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"-"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber - theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"x"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber * theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"/"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber / theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            theSecondNumber = resultString = @"";
            theOperand = @"+";
            [self tapButton:sender];
        }
        else if ([sender isEqual:minusButton])
        {
            if ([theOperand isEqualToString:@"+"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber + theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"-"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber - theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"x"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber * theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"/"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber / theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            theSecondNumber = resultString = @"";
            theOperand = @"-";
            [self tapButton:sender];
        }
        else if ([sender isEqual:mutiplyButton])
        {
            if ([theOperand isEqualToString:@"+"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber + theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"-"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber - theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"x"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber * theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"/"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber / theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            theSecondNumber = resultString = @"";
            theOperand = @"x";
            [self tapButton:sender];
        }
        else if ([sender isEqual:divideButton])
        {
            if ([theOperand isEqualToString:@"+"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber + theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"-"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber - theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"x"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber * theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"/"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber / theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            theSecondNumber = resultString = @"";
            theOperand = @"/";
            [self tapButton:sender];
        }
        else if ([sender isEqual:equalButton])
        {
            if ([theOperand isEqualToString:@"+"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber + theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"-"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber - theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"x"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber * theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            else if([theOperand isEqualToString:@"/"])
            {
                NSInteger theIntFirstNumber = [theFirstNumber integerValue];
                NSInteger theIntSecondNumber = [theSecondNumber integerValue];
                NSInteger theIntResult = theIntFirstNumber / theIntSecondNumber;
                theFirstNumber = [NSString stringWithFormat:@"%d", theIntResult];
                theTempNumber = theFirstNumber;
            }
            theSecondNumber = resultString = theOperand =  @"";
            resultLable.text = theTempNumber;
//            [self tapButton:sender];
        }
    }
    else if ([sender isEqual:return_zeroButton])
    {
        resultString = theFirstNumber = theSecondNumber = theOperand = theTempNumber = @"";
        resultLable.text = resultString;
        [self tapButton:sender];
    }
}



@end
