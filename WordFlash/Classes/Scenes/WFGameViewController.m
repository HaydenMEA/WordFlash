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
		
		UIButton *button = [UIButton buttonWithTitle:[_wordController.words[i] string] target:self selector:nil];
		[self.view addSubview:button];
		[_buttonMutable addObject:button];
		
	}
	NSLog(@"%@",_buttonMutable);
	
	//	_testButton = [UIButton buttonWithTitle:[_wordController.words[2] string] target:self selector:nil];
	//	[self.view addSubview:_testButton];
	
	_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(buttonMove:)];
	[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	
	
}
- (void)buttonMove:(CADisplayLink *)sender
{
	for (int r = 0; r < _buttonMutable.count; r++)
	{
		UIButton *button = _buttonMutable[r];
		CGFloat x = button.center.x + 0;
		CGFloat y = button.center.y + arc4random() % 7;
		
		button.center = CGPointMake(x, y);
		
		if (button.center.y > self.view.frame.size.height)
		{
			button.center = CGPointMake(arc4random() % (int)(self.view.frame.size.width), 0-arc4random()%300);
		}
		
	}
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
