//
//  CalculatorBrain.m
//  MyCalc
//
//  Created by Kwang Un Jin on 12. 1. 8..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@interface CalculatorBrain ()
// 여기는 private 선언 공간...
@property (nonatomic, strong) NSMutableArray *programStack;
@end




@implementation CalculatorBrain
@synthesize programStack = _programStack;


//-(double) popOperand
//{
//    NSNumber *programStack = [self.programStack lastObject];
//         
//    if(programStack != nil)
//        [self.programStack removeLastObject];
//    return [programStack doubleValue];
//}

-(NSMutableArray*) programStack
{
    if(_programStack == Nil) 
    {
        _programStack = [[NSMutableArray alloc] init];
    }
    return _programStack;
}

+ (void) PrintStack:(NSArray*)stack
{
    //for( int i = 0; i < self.programStack.count; i ++)
        
    for( id obj in stack)
    {
        
        NSLog(@"%@", obj); 
    }
    NSLog(@"-----------------");
}

- (void) pushOperand:(double)operand{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
    
}
 


-(double) performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];

    return [CalculatorBrain runProgram:self.program];
}

-(id) program
{
    return  [self.programStack copy];

}
    
+(NSString *) descriptionOfProgram:(id)program
{
    return @"Implement this in Assignment 2";
}

+(double)popOperandOffStack:(NSMutableArray *)stack
{
    
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if(topOfStack) [stack removeLastObject];
    
    if([topOfStack isKindOfClass:[NSNumber class]]) {
        result = [topOfStack doubleValue];
        
    }
    else if([topOfStack isKindOfClass:[NSString class]]) {
        NSString *operation = topOfStack;
        
        if([operation isEqualToString:@"*"])
        {
            double v1 = [self popOperandOffStack:stack];
            double v2 = [self popOperandOffStack:stack]; 
            result = v1 * v2;
            
        }
        else if([operation isEqualToString:@"+"])
        {
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        }
        else if([operation isEqualToString:@"/"])
        {
            //result = [self popOperandOffStack:stack] / [self popOperandOffStack:stack];

            double divisor = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] / divisor;
            
        }
        else if([operation isEqualToString:@"-"])
        {
            //result = [self popOperandOffStack:stack] - [self popOperandOffStack:stack];

            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;
            
        }
        
    }

    
    return result;
    
}


+(double) runProgram:(id)program
{
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
        
    }
    
        [self PrintStack:stack];
    return [self popOperandOffStack:stack];
    
}


@end







