//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Hodge, Janelle on 1/12/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()


@property (nonatomic) NSMutableArray *privateItemsLessThanFifty;
@property (nonatomic) NSMutableArray *privateItemsMoreThanFifty;


@end

@implementation BNRItemStore

+ (instancetype) sharedStore
{
    // Do I need to create a sharedStore?
    // Why set this to nil?
        // static BNRItemStore *sharedStore = nil;
    static BNRItemStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}


// If a coder calls [[BNRItemStore alloc]init], send an error message to him/her alerting them of what to do next
- (instancetype) init {
    
    [NSException raise:@"Singleton"
                format:@"Use + [BNRItemStore sharedStore]"];
    return nil;
}

// This is the real (yet, secret) initializer
- (instancetype) initPrivate {
    if (self = [super init]) {
        _privateItemsLessThanFifty = [[NSMutableArray alloc]init];
        _privateItemsMoreThanFifty = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSArray *) allItemsLessThanFifty {
    return [self.privateItemsLessThanFifty copy];
}


- (NSArray *) allItemsMoreThanFifty {
    return [self.privateItemsMoreThanFifty copy];
}

- (BNRItem *) createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    if (item.valueInDollars <50) {
        [self.privateItemsLessThanFifty addObject:item];
    } else {
        [self.privateItemsMoreThanFifty addObject:item];
    }
    return item;
}



@end
