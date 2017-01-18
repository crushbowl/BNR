//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Hodge, Janelle on 1/18/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"

@interface BNRDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BNRDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    BNRItem *item = self.item;
    
    self.nameTextField.text = item.itemName;
    self.serialNumberTextField.text = item.serialNumber;
    self.valueTextField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    
    // Include an NSDateFormatter to able to turn a date into a simple date string
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }

    // Use filtered NSDate object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
}


- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    
    // Clear first responder
    [self.view endEditing:YES];
    
    // "Save" changes to item
    BNRItem *item = self.item;
    item.itemName = self.nameTextField.text;
    item.serialNumber = self.serialNumberTextField.text;
    item.valueInDollars = [self.valueTextField.text intValue];
}

- (void)setItem:(BNRItem *)item {
    _item = item;
    self.navigationItem.title = _item.itemName;
}

// Bronze Challenge - Displaying a Number Pad
- (BOOL)textFieldShouldBeginEditing: (UITextField *)textField {
    
    if (self.valueTextField) {
        self.valueTextField.keyboardType = UIKeyboardTypeNumberPad;
        // [textField setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        [textField reloadInputViews];
    } else {
        [textField setKeyboardType:UIKeyboardTypeDefault];
        [textField reloadInputViews];
    }
    
    return YES;
}

// Silver Challenge - Dismissing the Number Pad
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end
