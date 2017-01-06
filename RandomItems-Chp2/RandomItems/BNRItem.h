//
//  BNRItem.h
//  RandomItems
//
//  Created by Hodge, Janelle on 1/4/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}


+ (instancetype) randomItem;

// Designated Initializer for BNRItem
- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *)sNumber;

- (instancetype) initWithItemName:(NSString *)name;


// Silver Challenge
- (instancetype) initWithNewItemName:(NSString *) newItemName serialNumber: (NSString *)newSerialNumber;


- (void)setItemName: (NSString *) str;
- (NSString *) itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *) serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (NSDate *)dateCreated;

@end
