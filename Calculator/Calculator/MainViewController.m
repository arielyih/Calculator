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
    resultString = @"";
    theFirstNumber = theSecondNumber = @"";
    theSecondNumber = @"";
    theOperand = @"";
    theTempNumber = @"";
    theTempOperand = @"";
    theIntTempNumber = theIntFirstNumber = theIntSecondNumber = 0;
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

    if ([theFirstNumber isEqual:@""] && [theOperand isEqual:@""])
    {
        if ( [sender isEqual:plusButton])
        {
            theFirstNumber = resultString;
            theOperand = @"+";
            resultString = @"";
            [self tapButton:sender];
        }
        
        else if ( [sender isEqual:minusButton])
        {
            theFirstNumber = resultString;
            theOperand = @"-";
            resultString = @"";
            [self tapButton:sender];
        }
        NSLog(@"%@", theFirstNumber);
        NSLog(@"%@", theOperand);
    }
  
    else if (![theFirstNumber isEqualToString:@""] && ![theOperand isEqualToString:@""] && [theTempOperand isEqualToString:@""])
    {
        if ( [sender isEqual:plusButton])
        {
            theSecondNumber = resultString;
            theTempOperand = @"+";
            resultString = @"";
            [self tapButton:sender];
        }
        
        else if ( [sender isEqual:minusButton])
        {
            theSecondNumber = resultString;
            theTempOperand = @"-";
            resultString = @"";
            [self tapButton:sender];
        }
        
        else if ( [sender isEqual: equalButton])
        {
            theSecondNumber = resultString;
            theIntFirstNumber = [theFirstNumber integerValue];
            theIntSecondNumber = [theSecondNumber integerValue];
            if ([theOperand isEqualToString :@"+"])
            {
                theIntTempNumber = theIntFirstNumber + theIntSecondNumber;
                theTempNumber = [NSString stringWithFormat:@"%d", theIntTempNumber];
                resultLable.text = theTempNumber;
            }
            else if ([theOperand isEqualToString:@"-"])
            {
                theIntTempNumber = theIntFirstNumber - theIntSecondNumber;
                theTempNumber = [NSString stringWithFormat:@"%d", theIntTempNumber];
                resultLable.text = theTempNumber;
            }
           resultString = theFirstNumber = theSecondNumber = theOperand = @"";
        }
    }
    
//    else if ( ![theFirstNumber isEqual:@""] && ![theOperand isEqual:@""] && ![theSecondNumber isEqual:@""] && ![theTempOperand isEqual:@""])
//    {
//        theIntFirstNumber = [theFirstNumber intValue];
//        theIntSecondNumber = [theSecondNumber intValue];
//        
//        if ([theOperand isEqual:@"+"] && [sender isEqual:plusButton])
//        {
//            theIntTempNumber = theIntFirstNumber + theIntSecondNumber;
//            theTempNumber = [NSString stringWithFormat:@"%d",theIntTempNumber];
//            theFirstNumber = theTempNumber;
//            theOperand = theTempOperand;
//            theSecondNumber = resultString;
//            theTempOperand = @"+";
//            resultString = @"";
//            [self tapButton:sender];
//        }
//        
//        else if ([theOperand isEqual:@"+"] && [sender isEqual:minusButton])
//        {
//            theIntTempNumber = theIntFirstNumber + theIntSecondNumber;
//            theTempNumber = [NSString stringWithFormat:@"%d",theIntTempNumber];
//            theFirstNumber = theTempNumber;
//            theOperand = theTempOperand;
//            theSecondNumber = resultString;
//            theTempOperand = @"-";
//            resultString = @"";
//            [self tapButton:sender];
//        }
//        
//        else if ([theOperand isEqual:@"+"] && [sender isEqual:equalButton])
//        {
//            theIntTempNumber = theIntFirstNumber + theIntSecondNumber;
//            theTempNumber = [NSString stringWithFormat:@"%d",theIntTempNumber];
//            theFirstNumber = theTempNumber;
//            theOperand = theTempOperand;
//            theSecondNumber = resultString;
//            theTempOperand = @"";
//            resultString = @"";
//            if ([theOperand isEqual:@"+"])
//            {
//                theIntFirstNumber = [theFirstNumber intValue];
//                theIntSecondNumber = [theSecondNumber intValue];
//                theIntTempNumber = theIntFirstNumber + theIntSecondNumber;
//                theTempNumber = [NSString stringWithFormat:@"%d",theIntTempNumber];
//                resultLable.text =theTempNumber;
//            }
//            
//            else if ([theOperand isEqual:@"-"])
//            {
//                theIntFirstNumber = [theFirstNumber intValue];
//                theIntSecondNumber = [theSecondNumber intValue];
//                theIntTempNumber = theIntFirstNumber - theIntSecondNumber;
//                theTempNumber = [NSString stringWithFormat:@"%d",theIntTempNumber];
//                resultLable.text =theTempNumber;
//            }
//        }
//        
//        else if ([theOperand isEqual:@"-"] && [sender isEqual:minusButton])
//        {
//            theIntTempNumber = theIntFirstNumber - theIntSecondNumber;
//            theTempNumber = [NSString stringWithFormat:@"%d",theIntTempNumber];
//            theFirstNumber = theTempNumber;
//            theOperand = theTempOperand;
//            theSecondNumber = resultString;
//            theTempOperand = @"-";
//            resultString = @"";
//            [self tapButton:sender];
//        }
//        
//        else if ([theOperand isEqual:@"-"] && [sender isEqual:plusButton])
//        {
//            theIntTempNumber = theIntFirstNumber - theIntSecondNumber;
//            theTempNumber = [NSString stringWithFormat:@"%d",theIntTempNumber];
//            theFirstNumber = theTempNumber;
//            theOperand = theTempOperand;
//            theSecondNumber = resultString;
//            theTempOperand = @"+";
//            resultString = @"";
//            [self tapButton:sender];
//        }
//    }
}



@end
