//
//  WFScoreViewController.h
//  WordFlash
//
//  Created by Matthew Seymour on 13/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFScoreViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *scoreAcheived;
@property (weak, nonatomic) IBOutlet UILabel *scoreAttainable;
- (IBAction)resetAction:(id)sender;



@end
