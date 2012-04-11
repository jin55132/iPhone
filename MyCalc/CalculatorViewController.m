//
//  CalculatorViewController.m
//  MyCalc
//
//  Created by Kwang Un Jin on 12. 1. 8..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain* brain;
@end



@implementation CalculatorViewController
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;



- (CalculatorBrain*) brain 
{
    if(! _brain) _brain = [[CalculatorBrain alloc] init];
    
    return _brain;
}


- (IBAction)digitPressed:(id)sender {
    NSString *digit = [sender currentTitle];
       
    if(self.userIsInTheMiddleOfEnteringANumber == NO)
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
        
    }
    else
    {
        self.display.text = [self.display.text stringByAppendingString:digit];
        
    }
    
    
}

- (IBAction)enterPressed {
    
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    
    
}

- (IBAction)operationPressed:(id)sender {

    if(self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    double result = [self.brain performOperation:[sender currentTitle]];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}



@end









