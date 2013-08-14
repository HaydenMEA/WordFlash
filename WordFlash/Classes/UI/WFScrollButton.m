//
//  WFScrollButton.m
//  WordFlash
//
//  Created by Hayden Young on 15/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFScrollButton.h"

@implementation WFScrollButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if(self)
	{
		UIImage *scrollImage = [UIImage imageNamed:@"scroll.png"];
		CGFloat widthInset = scrollImage.size.width * 0.5 -1;
		CGFloat heightInset = scrollImage.size.height * 0.5 -1;
		UIEdgeInsets insets = UIEdgeInsetsMake(heightInset, widthInset, heightInset, widthInset);
		scrollImage = [scrollImage resizableImageWithCapInsets:insets];
		[self setBackgroundImage:scrollImage forState:UIControlStateNormal];
		
		[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	}
	return self;
}

@end
