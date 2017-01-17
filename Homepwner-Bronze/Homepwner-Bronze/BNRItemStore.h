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


// Singleton - enforces only one instance for a given class - a way to share data between different parts of code without having to pass the data around manually

// Singletons are used in situations where this single point of control is desirable, such as with classes that offer some general service or resource.

// used to eliminate the option of instantiating more than one object
+ (instancetype) sharedStore;
- (BNRItem *) createItem;
- (NSArray *) allItemsLessThanFifty;
- (NSArray *) allItemsMoreThanFifty;


@end
