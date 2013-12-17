//
//  SHViewController.m
//  Example
//
//  Created by Seivan Heidari on 5/14/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//


#import "NSInvocation+SHInvocation.h"

#import "SHViewController.h"

@interface SHViewController ()
-(void)passTheFirstArgument:(NSString *)theFirstArgument
      passTheSecondArgument:(NSArray *)theSecondArgument;

@property(nonatomic,assign) NSString * firstArgument;
@property(nonatomic,assign) NSArray  * secondArgument;
@end

@implementation SHViewController

-(void)viewDidLoad;{
  [super viewDidLoad];
}

-(void)passTheFirstArgument:(NSString *)theFirstArgument passTheSecondArgument:(NSArray *)theSecondArgument; {
  self.firstArgument  = theFirstArgument;
  self.secondArgument = theSecondArgument;
}

-(void)viewDidAppear:(BOOL)animated; {
  
  NSString * firstArgument  = @"My first Argument";
  NSArray  * secondArgument = @[firstArgument, firstArgument, firstArgument];
  
 BOOL didInvoke = [NSInvocation SH_performInvocationOnTarget:self withSelector:@selector(passTheFirstArgument:passTheSecondArgument:) andArguments:@[firstArgument, secondArgument]];
  
  NSParameterAssert(didInvoke);
  NSParameterAssert([self.firstArgument  isEqualToString:firstArgument]);
  NSParameterAssert([self.secondArgument isEqual:secondArgument]);

  didInvoke = [NSInvocation SH_performInvocationOnTarget:self withSelector:@selector(passTheFirstArgument:passxTheSecondArgument:) andArguments:@[firstArgument, secondArgument]];
  
  NSParameterAssert(didInvoke);

  
}



@end
