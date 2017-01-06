//
//  BNRItem.m
//  RandomItems
//
//  Created by Hodge, Janelle on 1/4/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem


-(void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}

+ (instancetype) randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    
    return newItem;
}

// Designated Initializer for BNRItem
- (instancetype) initWithItemName:(NSString *)name
                   valueInDollars:(int)value
                     serialNumber:(NSString *)sNumber
{
    
    // Call the superclass' designated initializer: self = [super init];
    
    // super - allows you to keep what the method is doing and have the class
    // add something new on top of that
    if (self = [super init]) {
        
        // Give the instance variables initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        
        // Set _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    // Always return the newly initialized object so that the caller can assign it to a variable
    return self;
}

// Silver Challenge
- (instancetype) initWithNewItemName:(NSString *) newItemName serialNumber: (NSString *)newSerialNumber
{
    return [self initWithNewItemName:newItemName
                        serialNumber:newSerialNumber];
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

- (instancetype)init {
    return [self initWithItemName:@"Item"];
}

- (void)setContainedItem:(BNRItem *) item
{
    _containedItem = item;
    item.container = self;
}


-(BNRItem *)containedItem
{
    return _containedItem;
}

-(void)setContainer:(BNRItem *)item
{
    _container = item;
}


-(BNRItem *)container
{
    return _container;
}



- (void)setItemName: (NSString *) str
{
    _itemName = str;
}

- (NSString *) itemName
{
    return _itemName;
}

- (void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

- (NSString *) serialNumber
{
    return _serialNumber;
}

- (void)setValueInDollars:(int)v
{
    _valueInDollars = v;
}

- (int)valueInDollars
{
    return _valueInDollars;
}

- (NSDate *)dateCreated
{
    return _dateCreated;
}

- (NSString *) description {
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    return descriptionString;
}



@end
