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


@interface BNRItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
    
    //    UITableViewCell *footer = [[UITableViewCell alloc] init];
    //    footer.textLabel.text = @"No More Items!";
    //    self.tableView.tableFooterView = footer;
    
}

- (instancetype)init
{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    
    
    // Silver Challenge
    if ([items count] == 0)
    {
        cell.textLabel.text = @"No more items!";
    }
    else {
        BNRItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
    }
    return cell;
    
}


- (IBAction)addNewItem:(id)sender {
    
    
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItems]indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
}


- (IBAction)toggleEditingMode:(id)sender {
    
    if (self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
        [self setEditing:YES animated:YES];
    }
    
}

- (UIView *) headerView {
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return _headerView;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[BNRItemStore sharedStore]allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [[BNRItemStore sharedStore]moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
    
    
}

// Bronze Challenge

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Remove";
}




- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger row = indexPath.row;
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItems]count] +1;
    if (row == lastRow - 1) {
        return NO;
    } else {
        return YES;
    }
    
}


// Gold Challenge - https://developer.apple.com/reference/uikit/uitableviewdelegate/1614953-tableview?language=objc
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath

{
    // get number of objects
    NSUInteger numberOfObjects = [[[BNRItemStore sharedStore] allItems] count];
    
    if ( (proposedDestinationIndexPath.row+1==numberOfObjects) || (sourceIndexPath.row+1==numberOfObjects) ) {
        NSLog(@"HERE");
        return sourceIndexPath;
    }
    else{
        NSLog(@"count=%lu %ld", (unsigned long)[[[BNRItemStore sharedStore] allItems] count], (long)proposedDestinationIndexPath.row);
        return proposedDestinationIndexPath;
    }
}


//    UITableViewCell *item = [tableView cellForRowAtIndexPath:indexPath];
//
//    if ([item.textLabel.text isEqual:@"No more items!"]) {
//        return NO;
//    }

//    return YES;
// }


// Silver Challenge
//- (NSString *)tableView:(UITableView *)tableView
//titleForFooterInSection:(NSInteger)section
//{
//      return @"No More Items!";
//
//}

@end
