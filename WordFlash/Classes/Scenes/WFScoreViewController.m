//
//  WFScoreViewController.m
//  WordFlash
//
//  Created by Matthew Seymour on 13/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFScoreViewController.h"
#import "WFScoreManager.h"
#import "WFWordController.h"
#import "WFRootViewController.h"

@interface WFScoreViewController ()

@property (nonatomic, strong)WFScoreManager *scoreManager;
@property (nonatomic, strong)WFWordController *wordController;
@property (nonatomic, strong)WFRootViewController *rootController;

@end

@implementation WFScoreViewController

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
	_scoreManager = [WFScoreManager defaultManager];
	_wordController = [WFWordController defaultManager];
	
	_scoreAcheived.text = [NSString stringWithFormat:@"%i",(int)_scoreManager.score];
	_scoreAttainable.text = [NSString stringWithFormat:@"%i",(int)[_wordController.selectedWords count]];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)resetAction:(id)sender
{
	[self.view addSubview:_rootController.view];
	NSLog(@"YES");
}
@end
