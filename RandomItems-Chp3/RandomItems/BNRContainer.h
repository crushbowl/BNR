//
//  BNRContainer.h
//  RandomItems
//
//  Created by Hodge, Janelle on 1/5/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem


//NSArray *subitems = [[NSArray alloc] initWithObjects:, nil


-(instancetype) initWithContainerItem: (NSString *) name valueInDollars: (int) value listOfBNRItems: (BNRItem *) randomObject;


@end
