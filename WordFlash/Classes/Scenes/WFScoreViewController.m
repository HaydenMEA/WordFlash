//
//  WFScoreViewController.m
//  WordFlash
//
//  Created by Matthew Seymour on 13/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFScoreViewController.h"
#import "WFScoreManager.h"

@interface WFScoreViewController ()

@property (nonatomic, strong)WFScoreManager *scoreManager;

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
	
	_scoreAcheived.text = [NSString stringWithFormat:@"%i",(int)_scoreManager.score];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
