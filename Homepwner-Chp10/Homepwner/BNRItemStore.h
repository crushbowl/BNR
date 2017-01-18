//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Hodge, Janelle on 1/12/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

+ (instancetype) sharedStore;
- (BNRItem *) createItem;
- (void) removeItem:(BNRItem *) item;
- (void) moveItemAtIndex: (NSUInteger) fromIndex toIndex:(NSUInteger) toIndex;


@end
