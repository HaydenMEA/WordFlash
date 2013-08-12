//
//  WFWordController.h
//  WordFlash
//
//  Created by Tony Newth on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WFWordController;

@interface WFWordController : NSDictionary


@property(nonatomic, strong) NSArray *words;
@property(nonatomic, strong) NSMutableArray *selectedWords;


+(WFWordController *)defaultManager;

@end
