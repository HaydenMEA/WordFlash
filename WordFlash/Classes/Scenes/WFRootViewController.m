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

@interface WFRootViewController ()

@property (nonatomic, strong)WFWordListViewController *wordListVC;
@property (nonatomic, strong)WFGameViewController *gameVC;
@property (nonatomic, strong)WFScoreViewController *scoreVC;

@end

@implementation WFRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
	[_wordListVC.view removeFromSuperview];
	[self performSelector:@selector(scoreViewAction:) withObject:_scoreVC afterDelay:30];

	
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	NSLog(@"%f, %f",width , height);
	

}

- (IBAction)gameViewAction:(id)sender
{

	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	_gameVC = [storyboard instantiateViewControllerWithIdentifier:@"WFGameViewController"];
	[self.view addSubview:_gameVC.view];
}

- (IBAction)scoreViewAction:(id)sender
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	_scoreVC = [storyboard instantiateViewControllerWithIdentifier:@"WFGameViewController"];
	[self.view addSubview:_scoreVC.view];
}


@end
