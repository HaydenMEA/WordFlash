//
//  WFWordController.m
//  WordFlash
//
//  Created by Tony Newth on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFWordController.h"
#import "WFWordList.h"

@interface WFWordList ();
@property (nonatomic, strong) NSDictionary *words;


@end


@implementation WFWordController


+(WFWordController *)defaultManager;
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

		
	}

return self;
}



@end
