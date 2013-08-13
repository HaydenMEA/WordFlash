//
//  WFScoreManager.m
//  WordFlash
//
//  Created by Tony Newth on 13/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFScoreManager.h"

@implementation WFScoreManager



+(WFScoreManager *)defaultManager 	//--create a singleton
{
	static __strong WFScoreManager *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[WFScoreManager alloc] init];
	});
	
	return sharedInstance;
}

- (id) init
{
	self = [super init];
	if(self)
	{

		
	}
	return self;
}

-(void)increaseScore:(NSInteger)score
{
	_score += 1; //score;
//	score += 1;
//	_labelScore.text = [NSString stringWithFormat:@"score %i", _score];
}

-(void)resetScore:(NSInteger)score
{
	_score = 0;
}


@end
