//
//  BNRContainer.h
//  RandomItems
//
//  Created by Hodge, Janelle on 1/5/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem


-(instancetype) initWithContainerItem: (NSString *) name valueInDollars: (int) integer;
-(NSMutableArray *) createArray;



@end
