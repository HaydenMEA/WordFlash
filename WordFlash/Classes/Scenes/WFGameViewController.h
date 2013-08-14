//
//  WFGameViewController.h
//  WordFlash
//
//  Created by Matthew Seymour on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
typedef void (^WFScoreView)(void);


@interface WFGameViewController : UIViewController
@property (nonatomic, copy) WFScoreView scoreView;

@property (weak, nonatomic) IBOutlet UIImageView *arrow;

@end
