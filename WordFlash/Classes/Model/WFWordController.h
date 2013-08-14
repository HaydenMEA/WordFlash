//
//  WFWordController.h
//  WordFlash
//
//  Created by Tony Newth on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WFWordController;
@class WFword;

@interface WFWordController : NSObject


@property(nonatomic, strong) NSArray *words;
@property(nonatomic, strong) NSArray *selectedWords;

+(WFWordController *)defaultManager;
- (BOOL)containsWord:(WFword *)word;

- (void)loadWordsWithSpeedModifier:(CGFloat)speedModifer;

-(void)createWords:(NSInteger)numberOfWords;

-(void)createDistractWords:(NSInteger)numberOfDistractWords;

@end
