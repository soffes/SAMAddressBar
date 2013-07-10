//
//  SAMAddressBar.h
//  SAMAddressBar
//
//  Created by Sam Soffes on 7/10/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SAMAddressBarTextField;

@interface SAMAddressBar : UINavigationBar

@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) SAMAddressBarTextField *textField;

@end
