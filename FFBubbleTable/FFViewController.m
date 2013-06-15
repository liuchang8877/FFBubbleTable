//
//  FFViewController.m
//  FFBubbleTable
//
//  Created by liu on 6/15/13.
//  Copyright (c) 2013 liu. All rights reserved.
//

#import "FFViewController.h"
#import "UIBubbleTableView.h"
#import "UIBubbleTableViewDataSource.h"
#import "NSBubbleData.h"

@interface FFViewController () {

    UIBubbleTableView *myBubbleTable;
    NSMutableArray *bubbleData;
}


@end

@implementation FFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //set table view
    [self setTheBubbleTable];
    
    //set the table view 's data
    [self setTheTableData];
}

- (void)setTheBubbleTable {
 
    myBubbleTable = [[UIBubbleTableView alloc] init];
    
    myBubbleTable.bubbleDataSource = self;
    
    myBubbleTable.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:myBubbleTable];

}

- (void)setTheTableData {

    bubbleData = [[NSMutableArray alloc] initWithObjects:
                  [NSBubbleData dataWithText:@"Marge, there's something that I want to ask you, but I'm afraid, because if you say no, it will destroy me and make me a criminal." andDate:[NSDate dateWithTimeIntervalSinceNow:-300] andType:BubbleTypeMine],
                  [NSBubbleData dataWithText:@"Well, I haven't said no to you yet, have I?" andDate:[NSDate dateWithTimeIntervalSinceNow:-280] andType:BubbleTypeSomeoneElse],
                  [NSBubbleData dataWithText:@"Marge... Oh, damn it." andDate:[NSDate dateWithTimeIntervalSinceNow:0] andType:BubbleTypeMine],
                  [NSBubbleData dataWithText:@"What's wrong?" andDate:[NSDate dateWithTimeIntervalSinceNow:300]  andType:BubbleTypeSomeoneElse],
                  [NSBubbleData dataWithText:@"Ohn I wrote down what I wanted to say on a card.." andDate:[NSDate dateWithTimeIntervalSinceNow:395]  andType:BubbleTypeMine],
                  [NSBubbleData dataWithText:@"The stupid thing must have fallen out of my pocket." andDate:[NSDate dateWithTimeIntervalSinceNow:400]  andType:BubbleTypeMine],
                  nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIBubbleTableViewDataSource implementation

- (NSInteger)rowsForBubbleTable:(UIBubbleTableView *)tableView
{
    return [bubbleData count];
}

- (NSBubbleData *)bubbleTableView:(UIBubbleTableView *)tableView dataForRow:(NSInteger)row
{
    return [bubbleData objectAtIndex:row];
}

@end
