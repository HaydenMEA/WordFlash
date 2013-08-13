//
//  WFViewController.m
//  WordFlash
//
//  Created by Hayden Young on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFRootViewController.h"
#import "WFWordListViewController.h"
#import "WFGameViewController.h"
#import "WFScoreViewController.h"
#import "WFdifficulty.h"

@interface WFRootViewController ()

@property (nonatomic, strong)WFWordListViewController *wordListVC;
@property (nonatomic, strong)WFGameViewController *gameVC;
@property (nonatomic, strong)WFScoreViewController *scoreVC;
@property (nonatomic, strong)WFdifficulty *difficulty;
@property (nonatomic, strong)WFdifficulty *level;


@end

@implementation WFRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	UIImage *image = [UIImage imageNamed:@"background.png"];
	self.view.backgroundColor = [UIColor colorWithPatternImage:image];
	//	CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
	//	self.view = [[UIView alloc]initWithFrame:frame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButton:(id)sender
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	_wordListVC = [storyboard instantiateViewControllerWithIdentifier:@"WordListViewController"];
	[self.view addSubview:_wordListVC.view];
	[self performSelector:@selector(gameViewAction:) withObject:_gameVC afterDelay:2];
	
	[self performSelector:@selector(scoreViewAction:) withObject:_scoreVC afterDelay:9];
	
	
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	NSLog(@"%f, %f",width , height);
	
	
}

- (IBAction)gameViewAction:(id)sender
{
	
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	_gameVC = [storyboard instantiateViewControllerWithIdentifier:@"WFGameViewController"];
	[self.view addSubview:_gameVC.view];
	[_wordListVC.view removeFromSuperview];
}


//--Added new levels of game -- easy medium hard ---
- (IBAction)startEasy:(id)sender
{
	
	_level = [WFdifficulty easy];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	_wordListVC = [storyboard instantiateViewControllerWithIdentifier:@"WordListViewController"];
	[self.view addSubview:_wordListVC.view];
	[self performSelector:@selector(gameViewAction:) withObject:_gameVC afterDelay:_level.displayTime];
	[self performSelector:@selector(scoreViewAction:) withObject:_scoreVC afterDelay:_level.gameTime];
	
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	NSLog(@"%f, %f",width , height);
	
}

- (IBAction)startMedium:(id)sender
{
	
	_level = [WFdifficulty medium];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	_wordListVC = [storyboard instantiateViewControllerWithIdentifier:@"WordListViewController"];
	[self.view addSubview:_wordListVC.view];
	[self performSelector:@selector(gameViewAction:) withObject:_gameVC afterDelay:_level.displayTime];
	[self performSelector:@selector(scoreViewAction:) withObject:_scoreVC afterDelay:_level.gameTime];
	
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	NSLog(@"%f, %f",width , height);
}

- (IBAction)startHard:(id)sender
{
	
	_level = [WFdifficulty hard];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	_wordListVC = [storyboard instantiateViewControllerWithIdentifier:@"WordListViewController"];
	[self.view addSubview:_wordListVC.view];
	[self performSelector:@selector(gameViewAction:) withObject:_gameVC afterDelay:_level.displayTime];
	[self performSelector:@selector(scoreViewAction:) withObject:_scoreVC afterDelay:_level.gameTime];
	
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	NSLog(@"%f, %f",width , height);
}

- (IBAction)scoreViewAction:(id)sender
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	_scoreVC = [storyboard instantiateViewControllerWithIdentifier:@"WFScoreViewController"];
	[self.view addSubview:_scoreVC.view];
	[_gameVC.view removeFromSuperview];
	
}


@end
