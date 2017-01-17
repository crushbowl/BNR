//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Hodge, Janelle on 1/12/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

{
    NSArray * sectionArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:
                                     [UIImage imageNamed:@"planetEarth.jpg"]];
    sectionArray = @[@"Below 50", @"Above 50"];
    
    
}

- (instancetype)init
{
    // Call the superclass's designated initializer, which ensures that every ivar(instance variable) of an object is valid - i.e. you can predict the outcome and guarantee nothing bad will happen
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
        // add five random items to the BNRItemStore
        for (int i =0; i<5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return sectionArray.count;
}

// Silver Challenge
- (NSString *)tableView:(UITableView *)tableView
titleForFooterInSection:(NSInteger)section
{
    if (tableView.tableFooterView == 0)
    {
        return @"No More Items!";
    }
    else {
        
        return @"No More Items!";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return sectionArray[0];
    }
    else if (section == 1)
    {
        return sectionArray[1];
    }
    return @"title for header";
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return [[[BNRItemStore sharedStore] allItemsLessThanFifty]count];
    }
    else {
        return [[[BNRItemStore sharedStore] allItemsMoreThanFifty]count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld %ld", (long)indexPath.section, (long)indexPath.row);
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Gold Challenge
    if (indexPath.section==0) {
        
        NSArray *arrayItems = [[BNRItemStore sharedStore] allItemsLessThanFifty];
        BNRItem *item = arrayItems[indexPath.row];
        cell.textLabel.text = [item description];
        UIFont *myFont = [UIFont fontWithName: @"HelveticaNeue-Light" size: 20.0];
        cell.textLabel.font  = myFont;
        
        return cell;
        
    } else {
        NSArray *items = [[BNRItemStore sharedStore] allItemsMoreThanFifty];
        BNRItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
        UIFont *myFont = [UIFont fontWithName: @"HelveticaNeue-Light" size: 20.0];
        cell.textLabel.font  = myFont;
        return cell;
    }
    
    return cell;
}

// Gold Challenge
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


@end
