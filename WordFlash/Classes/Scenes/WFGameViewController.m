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
#import "WFScoreManager.h"
#import "WFCorrectWordsViewController.h"
#import "WFWrongWordsViewController.h"

@interface WFGameViewController ()

@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) WFWordController *wordController;
@property (nonatomic, strong) NSArray *words;
@property (nonatomic, strong) NSMutableArray *buttonMutable;
@property (nonatomic, strong) WFScoreManager *scoreManager;
@property (nonatomic, strong) WFCorrectWordsViewController *correctWords;
@property (nonatomic, strong) WFWrongWordsViewController *wrongWords;



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
	_scoreManager = [WFScoreManager defaultManager];
	
	_correctWords = [[WFCorrectWordsViewController alloc] init];
	_wrongWords = [[WFWrongWordsViewController alloc] init];
	
	[self.view addSubview:_wrongWords.view];
	[self.view addSubview:_correctWords.view];
	
//	NSLog(@"%@", _wordController.words);
	_buttonMutable = [[NSMutableArray alloc] init];
	
	
	for (int i = 0; i < _wordController.selectedDistractWords.count; i++)
	{
		
		UIButton *button = [UIButton buttonWithTitle:[_wordController.selectedDistractWords[i] string] target:self selector:@selector(wordTappedAction:)event:UIControlEventTouchDown];

////------ KEEPING TRACK OF BUTTONS ------

		button.tag = i;

////------ ADDING A SCROLL IMAGE TO BUTTON ------
		
		UIImage *scrollImage = [UIImage imageNamed:@"scroll.png"];
		CGFloat widthInset = scrollImage.size.width * 0.5 -1;
		CGFloat heightInset = scrollImage.size.height * 0.5 -1;
		UIEdgeInsets insets = UIEdgeInsetsMake(heightInset, widthInset, heightInset, widthInset);
		scrollImage = [scrollImage resizableImageWithCapInsets:insets];
		[button setBackgroundImage:scrollImage forState:UIControlStateNormal];
		
////------ SET COLOR OF BUTTON TEXT ------
		
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[button sizeToFit];
		
		[_wrongWords.view addSubview:button];

		

////------ RANDOMIZE WHERE BUTTON SPAWNS ABOVE THE SCREEN ------
		
		[self randomizeCenter:button];
		[_buttonMutable addObject:button];
		
	}
	for (int i = 0; i < _wordController.selectedWords.count; i++)
	{
		
		UIButton *button2 = [UIButton buttonWithTitle:[_wordController.selectedWords[i] string] target:self selector:@selector(wordTappedAction:)event:UIControlEventTouchDown];
		
		////------ KEEPING TRACK OF BUTTONS ------
		
		button2.tag = i;
		
		////------ ADDING A SCROLL IMAGE TO BUTTON ------
		
		UIImage *scrollImage = [UIImage imageNamed:@"scroll.png"];
		CGFloat widthInset = scrollImage.size.width * 0.5 -1;
		CGFloat heightInset = scrollImage.size.height * 0.5 -1;
		UIEdgeInsets insets = UIEdgeInsetsMake(heightInset, widthInset, heightInset, widthInset);
		scrollImage = [scrollImage resizableImageWithCapInsets:insets];
		[button2 setBackgroundImage:scrollImage forState:UIControlStateNormal];
		
		////------ SET COLOR OF BUTTON TEXT ------
		
//		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[button2 sizeToFit];
		
		[_correctWords.view addSubview:button2];
		
		
		
		////------ RANDOMIZE WHERE BUTTON SPAWNS ABOVE THE SCREEN ------
		
		[self randomizeCenter:button2];
		[_buttonMutable addObject:button2];
		
	}
	NSLog(@"%@",_buttonMutable);
	
	
	
	_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(buttonMove:)];
	[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	
	
}
- (void)wordTappedAction:(UIButton *)button2
{
	if ([_wordController containsWord:_wordController.selectedWords[button2.tag]] == YES)
	{
		CGFloat arrowX = 186;
		CGFloat arrowY = _arrow.center.y;
		
		[UIView animateWithDuration:.8 animations:^
		 {
			 _arrow.center = CGPointMake(arrowX, arrowY);
			 
		 } completion:^(BOOL finished)
		 {
			 _arrow.center = CGPointMake(-50, arrowY);
			 
		 }];
		
		[button2 removeFromSuperview];
		[_scoreManager increaseScore:1];
		NSLog(@"YES");
	}
	else
	{
		for(int i = 0; i < self.buttonMutable.count; i++)
		{
			UIButton *button = _buttonMutable[i];
			[self randomizeCenter:button];
		 }
		NSLog(@"NO");

	}
	

}

////------ RANDOMIZE WHERE BUTTON SPAWNS ABOVE THE SCREEN WITHIN THE WIDTH ------


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

////------ MAKE BUTTONS FALL DOWN THE SCREEN ------

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
