//
//  main.m
//  RandomItems
//
//  Created by Hodge, Janelle on 1/4/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        
        BNRContainer *item = [[BNRContainer alloc] initWithContainerItem:@"info" valueInDollars:10];
        [item createArray];
        
        
        // Bronze Challenge - Bug finding
        //  NSString *foo = items[11];
        //  NSLog(@"%@", foo);
        
       
        NSLog(@"%@",item);
        //Destroys the mutable array object
        items = nil;
    }
    return 0;
}
