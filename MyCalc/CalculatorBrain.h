//
//  CalculatorBrain.h
//  MyCalc
//
//  Created by Kwang Un Jin on 12. 1. 8..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void) pushOperand : (double) operand;
-(double) performOperation : (NSString *) operation;

@property (readonly) id program;
+(double) runProgram:(id)program;
+(NSString *) descriptionOfProgram:(id)program;


@end
