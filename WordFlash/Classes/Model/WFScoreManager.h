//
//  WFScoreManager.h
//  WordFlash
//
//  Created by Tony Newth on 13/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFScoreManager : NSObject
@property(nonatomic, assign)NSInteger *score;


+(WFScoreManager *)defaultManager;

-(void)increaseScore:(NSInteger)score;
-(void)resetScore:(NSInteger)score;


@end
