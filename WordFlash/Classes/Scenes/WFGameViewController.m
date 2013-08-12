//
//  WFGameViewController.m
//  WordFlash
//
//  Created by Matthew Seymour on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFGameViewController.h"

@interface WFGameViewController ()

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

- (void)viewDidAppear:(BOOL)animated
{
//	_motionManager = [[CMMotionManager alloc] init];
//	if (_motionManager.deviceMotionAvailable)
//	{
//		_motionManager.deviceMotionUpdateInterval = 1.0/60.0;
//		
//		NSOperationQueue *queue = [NSOperationQueue mainQueue];
//		[_motionManager startDeviceMotionUpdatesToQueue:queue withHandler:^(CMDeviceMotion *motion, NSError *error)
//		 {
//			 _deviceMotion = motion;
//			 
//		 }];
//		
//	} else{
//		NSLog(@"no motion");
//	}
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	UIButton *testButton = [UIButton buttonWithTitle:@"test" target:self selector:nil];
	[self.view addSubview:testButton];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
