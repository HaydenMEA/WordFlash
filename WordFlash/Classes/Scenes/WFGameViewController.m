//
//  WFGameViewController.m
//  WordFlash
//
//  Created by Matthew Seymour on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFGameViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "WFWordController.h"
#import "WFword.h"


@interface WFGameViewController ()

@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) WFWordController *wordController;
@property (nonatomic, strong) NSArray *words;
@property (nonatomic, strong) NSMutableArray *buttonMutable;


@end

@implementation WFGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	_wordController = [WFWordController defaultManager];
	NSLog(@"%@", _wordController.words);
	_buttonMutable = [[NSMutableArray alloc] init];
	
	
	for (int i = 0; i < _wordController.words.count; i++)
	{
		
		UIButton *button = [UIButton buttonWithTitle:[_wordController.words[i] string] target:self selector:@selector(wordTappedAction:)];
		button.tag = i;
		[self.view insertSubview:button atIndex:0];
		[self randomizeCenter:button];
		[_buttonMutable addObject:button];
		
	}
	NSLog(@"%@",_buttonMutable);
	
	
	
	_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(buttonMove:)];
	[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	
	
}
- (void)wordTappedAction:(UIButton *)button
{
	if ([_wordController containsWord:_wordController.words[button.tag]] == YES)
	{
		
	}
	else 
	{
		
	}
	
}

- (void)randomizeCenter:(UIButton *)button
{
    int width = self.view.frame.size.width;
    int buttonWidth = button.frame.size.width;
	
	int randomX = (arc4random() % width);
	
	if (randomX < buttonWidth * 0.5)
	{
		randomX += buttonWidth * 0.5;
	}
	
	if (randomX > (width-buttonWidth *0.5))
	{
		randomX = width - buttonWidth * 0.5;
	}
	button.center = CGPointMake(randomX, 0-arc4random()%300);
    
}

- (void)buttonMove:(CADisplayLink *)sender
{
	
	for (int r = 0; r < _buttonMutable.count; r++)
	{
		UIButton *button = _buttonMutable[r];
		
		CGFloat x = button.center.x + 0;
		CGFloat y = button.center.y + [_wordController.words[r]speed];
		
		button.center = CGPointMake(x, y);
		if (button.center.y > self.view.frame.size.height)
		{
			[self randomizeCenter:button];
		}
	}
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
