//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 8/2/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "SHInvocation.h"


@interface SHInvocationTests : SenTestCase
-(void)passTheFirstArgument:(NSString *)theFirstArgument
      passTheSecondArgument:(NSArray *)theSecondArgument;

@property(nonatomic,assign) NSString * firstArgument;
@property(nonatomic,assign) NSArray  * secondArgument;

@end


@implementation SHInvocationTests


-(void)passTheFirstArgument:(NSString *)theFirstArgument passTheSecondArgument:(NSArray *)theSecondArgument; {
  self.firstArgument  = theFirstArgument;
  self.secondArgument = theSecondArgument;
}

-(void)testSH_performInvocationOnTarget_withSelector_andArguments; {
  NSString * firstArgument  = @"My first Argument";
  NSArray  * secondArgument = @[firstArgument, firstArgument, firstArgument];
  
  BOOL didInvoke = [NSInvocation SH_performInvocationOnTarget:self withSelector:@selector(passTheFirstArgument:passTheSecondArgument:) andArguments:@[firstArgument, secondArgument]];
  
  STAssertTrue(didInvoke, nil);
  STAssertEqualObjects(self.firstArgument, firstArgument, nil);
  STAssertEqualObjects(self.secondArgument, secondArgument, nil);
}

-(void)testSH_performInvocationOnTarget_withSelector_andArguments_DoesNotInvoke; {
  NSString * firstArgument  = @"My first Argumentx";
  NSArray  * secondArgument = @[firstArgument, firstArgument];

  BOOL didInvoke = [NSInvocation SH_performInvocationOnTarget:self withSelector:@selector(passTheFirstArgument:passxTheSecondArgument:) andArguments:@[firstArgument, secondArgument]];
  
  STAssertFalse(didInvoke, nil);

}




@end
