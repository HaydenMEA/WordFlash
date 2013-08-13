//
//  WFdifficulty.h
//  WordFlash
//
//  Created by Tony Newth on 13/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFdifficulty : NSObject

@property(nonatomic, strong) NSArray *dificulty;

@property(nonatomic, assign) NSInteger numberOfWords;
@property(nonatomic, assign) NSInteger displayTime;
@property(nonatomic, assign) CGFloat fallRate;
@property(nonatomic, assign) NSInteger gameTime;


+(WFdifficulty *)easy;
+(WFdifficulty *)medium;
+(WFdifficulty *)hard;


@end
