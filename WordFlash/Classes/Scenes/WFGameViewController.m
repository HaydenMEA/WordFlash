//
//  WFGameViewController.m
//  WordFlash
//
//  Created by Matthew Seymour on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFGameViewController.h"
#import <CoreMotion/CoreMotion.h>
//#import "WFWordController.h"
//#import "WFword.h"


@interface WFGameViewController ()

@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) CADisplayLink *displayLink;
//@property (nonatomic, strong) WFWordController *wordController;
//@property (nonatomic, strong) NSArray *words;


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
//	_wordController = [WFWordController defaultManager];
//	NSLog(@"%@", _wordController);
	
	_testButton = [UIButton buttonWithTitle:@"test" target:self selector:nil];
	[self.view addSubview:_testButton];

	_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(buttonMove:)];
	[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

	
}
- (void)buttonMove:(CADisplayLink *)sender
{
    //	CGPoint point = self.view.center;
    CGFloat x = _testButton.center.x + 0;
	CGFloat y = _testButton.center.y + 5;
	
	_testButton.center = CGPointMake(x, y);
	
	if (_testButton.center.y > self.view.frame.size.height)
	{
		_testButton.center = CGPointMake(x, 0);
	}
	
	
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
