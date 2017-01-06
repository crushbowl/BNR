//
//  main.m
//  RandomItems
//
//  Created by Hodge, Janelle on 1/4/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        BNRItem *backpack= [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
 
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        
        //Destroys the mutable array object
        items = nil;
    }
    return 0;
}
