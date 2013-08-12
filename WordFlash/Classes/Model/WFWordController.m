//
//  WFWordController.m
//  WordFlash
//
//  Created by Tony Newth on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFWordController.h"
#import "WFword.h"



@implementation WFWordController


+(WFWordController *)defaultManager
{
	static __strong WFWordController *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[WFWordController alloc] init]; 		
	});
	
	return sharedInstance;
}


- (id) init
{
	self = [super init];
	if(self)
	{
		NSArray *strings = @[@"Apple", @"Banana", @"Happy", @"Weather", @"Table", @"Computer", @"Screen", @"Building", @"Sun", @"Coffee", @"Audion", @"Anatidaephobia", @"Agateophobia"];
		
		NSMutableArray *wordsM = [[NSMutableArray alloc] init];

		[strings enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			WFword *word = [[WFword alloc] init];
			word.string = obj;
			if((80 / [obj length]) < 5)	//--give each word different speeds based on length
				word.speed = 5;
			else word.speed = 80 / [obj length];
			[wordsM addObject:word];
		}];
		_words = wordsM;
	}
	
	return self;
}




-(NSArray *)getWordsToRemember
{
	NSMutableArray *selectedWords = [[NSMutableArray alloc] init];	//Create a set to hold a selection of words
	NSMutableArray *wordSelection = [[NSMutableArray alloc] initWithArray:_words];
	for(int x=0; x<5; x++)
	{
	int indexNumberToUse = arc4random() %wordSelection.count; //--select words to use from the dictionary
		
	[selectedWords addObject:wordSelection[indexNumberToUse]]; 
	[wordSelection removeObject:wordSelection[indexNumberToUse]];//- populate the set with the words from the array
		 }
	
	return selectedWords;
}

- (BOOL)containsWord:(WFword *)word		//--checks if the word existed in selected words
{
	BOOL contains = [_selectedWords containsObject:word];
	
	return contains;
}


@end
