//
//  SAMAddressBarTextField.h
//  SAMAddressBar
//
//  Created by Sam Soffes on 2/8/11.
//  Copyright 2011-2013 Sam Soffes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAMAddressBarTextField : UITextField

@property (nonatomic, getter = isLoading) BOOL loading;
@property (nonatomic, readonly) UIButton *reloadButton;
@property (nonatomic, readonly) UIButton *stopButton;

@end
