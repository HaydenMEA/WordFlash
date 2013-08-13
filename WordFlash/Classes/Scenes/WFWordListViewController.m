//
//  WFWordListViewController.m
//  WordFlash
//
//  Created by Matthew Seymour on 12/08/13.
//  Copyright (c) 2013 Hayden Young. All rights reserved.
//

#import "WFWordListViewController.h"
#import "WFWordController.h"

@interface WFWordListViewController ()
@property (nonatomic, strong) WFWordController *wordController;
@property (nonatomic, strong) NSArray *words;

@end

@implementation WFWordListViewController


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
	_wordController.selectedWords = [_wordController getWordsToRemember];

	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _wordController.selectedWords.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	cell.textLabel.text =[_wordController.selectedWords[indexPath.row] string];
	
	NSLog(@"%@",[_wordController.selectedWords[indexPath.row] string]);
	
	
//	CCPart *part = self.computer.parts[indexPath.row];
//	cell.textLabel.text = [part name];
//	cell.detailTextLabel.text = part.details;
//	cell.imageView.image = [UIImage imageNamed:part.imageName];
	
	return cell;
}

@end
