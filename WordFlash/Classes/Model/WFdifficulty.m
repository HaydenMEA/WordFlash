//
//  WFdifficulty.m
//  WordFlash
//
//  Created by Tony Newth on 13/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFdifficulty.h"

@implementation WFdifficulty


//--Call whichever dicciculty you need

//--Create objects with properties -numberOfWords - displayTime - fallRate - gameTime and populate an array


- (id) init
{
	self = [super init];
	if(self)
	{
	}
	return self;
};


+(WFdifficulty *)easy
{
	WFdifficulty *difficulty = [[WFdifficulty alloc] init];
	difficulty.numberOfWords = 8;
	difficulty.displayTime = 20;
	difficulty.fallRate = 0.75;
	difficulty.gameTime = 30;
	
	return difficulty;
}
+(WFdifficulty *)medium
{
	WFdifficulty *difficulty = [[WFdifficulty alloc] init];
	difficulty.numberOfWords = 8;
	difficulty.displayTime = 20;
	difficulty.fallRate = 0.75;
	difficulty.gameTime = 30;
	
	return difficulty;
}
+(WFdifficulty *)hard
{
	WFdifficulty *difficulty = [[WFdifficulty alloc] init];
	difficulty.numberOfWords = 8;
	difficulty.displayTime = 20;
	difficulty.fallRate = 0.75;
	difficulty.gameTime = 30;
	
	return difficulty;
}




@end
