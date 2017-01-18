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

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype) sharedStore {
    static BNRItemStore *sharedStore;
    
    if (! sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init {
    [NSException raise:@"Singleton"
                format:@"Use + [BNRItemStore sharedStore]"];
    return nil;
}

- (instancetype) initPrivate {
    if (self = [super init]) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) allItems {
    return [self.privateItems copy];
}

- (BNRItem *) createItem {
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

- (void) removeItem:(BNRItem *) item {
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void) moveItemAtIndex: (NSUInteger) fromIndex toIndex:(NSUInteger) toIndex {
    if(fromIndex == toIndex) {
        return;
    }

    BNRItem *item = self.privateItems[fromIndex];
    
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    [self.privateItems insertObject:item atIndex:toIndex];

}

@end
