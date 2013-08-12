//
//  WFword.m
//  WordFlash
//
//  Created by Tony Newth on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFword.h"

@implementation WFword

/// --- how to print out other descriptions of objects

- (NSString *)description
{
	return 	[NSString stringWithFormat:@"%@, %@", [super description], self.string];
}

@end
