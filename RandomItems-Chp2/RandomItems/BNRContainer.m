//
//  BNRContainer.m
//  RandomItems
//
//  Created by Hodge, Janelle on 1/5/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

{
    NSMutableArray *subitems;
}


-(instancetype)initWithContainerItem:(NSString *)name valueInDollars:(int)dollarValue {
    if (self = [super init]) {
        _itemName = name;
        _valueInDollars = dollarValue;
    }
    return self;
}

- (int) calculateAvgValue {
    
    int totalAmt = 0;

    for (BNRItem *dv in subitems) {
        totalAmt += dv.valueInDollars;
    }
    return totalAmt + _valueInDollars;
}


- (NSMutableArray *) createArray {
  subitems = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<2; i++) {
        BNRItem *subitem = [BNRItem randomItem];
        [subitems addObject:subitem];
    }
    return subitems;
}


- (NSString *) description
{
    NSString *descript = [[NSString alloc]initWithFormat:@"%@ : Total Dollar Value: $%d, list of BNRItem instances: %@", self.itemName, [self calculateAvgValue], subitems];
    
    return descript;
}

@end
