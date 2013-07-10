//
//  SAMAddressBarTextField.m
//  SAMAddressBar
//
//  Created by Sam Soffes on 2/8/11.
//  Copyright 2011-2013 Sam Soffes. All rights reserved.
//

#import "SAMAddressBarTextField.h"
#import "SAMAddressBarTextFieldBackgroundView.h"

@interface SAMAddressBarTextField ()
@property (nonatomic, readonly) SAMAddressBarTextFieldBackgroundView *barBackgroundView;
@end

@implementation SAMAddressBarTextField

#pragma mark - Accessors

@synthesize loading = _loading;
@synthesize reloadButton = _reloadButton;
@synthesize stopButton = _stopButton;
@synthesize barBackgroundView = _barBackgroundView;

- (SAMAddressBarTextFieldBackgroundView *)barBackgroundView {
	if (!_barBackgroundView) {
		_barBackgroundView = [[SAMAddressBarTextFieldBackgroundView alloc] init];
	}
	return _barBackgroundView;
}


- (UIButton *)reloadButton {
	if (!_reloadButton) {
		_reloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_reloadButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
		_reloadButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		[_reloadButton setImage:[UIImage imageNamed:@"SAMAddressBar-reload"] forState:UIControlStateNormal];
	}
	return _reloadButton;
}


- (UIButton *)stopButton {
	if (!_stopButton) {
		_stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_stopButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
		_stopButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		[_stopButton setImage:[UIImage imageNamed:@"SAMAddressBar-stop"] forState:UIControlStateNormal];
	}
	return _stopButton;
}


- (void)setLoading:(BOOL)isLoading {
	if (_loading == isLoading) {
		return;
	}
	_loading = isLoading;
	
	self.rightView = _loading ? self.stopButton : self.reloadButton;
	self.barBackgroundView.loading = _loading;
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self initialize];
	}
	return self;
}


- (id)initWithFrame:(CGRect)aFrame {
	if ((self = [super initWithFrame:aFrame])) {
		[self initialize];
	}
	return self;
}


- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGSize size = self.frame.size;
	self.barBackgroundView.frame = CGRectMake(1.0f, 1.0f, size.width - 2.0f, size.height - 2.0f);
}


#pragma mark - UITextField

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
	CGSize size = self.frame.size;
	return CGRectMake(size.width - 24.0f, roundf((size.height - 18.0f) / 2.0f), 16.0f, 18.0f);
}


- (CGRect)textRectForBounds:(CGRect)bounds {
	return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], UIEdgeInsetsMake(0.0f, 5.0f, 0.0f, 26.0f));
}


#pragma mark - Private

- (void)initialize {
	// Configure text field
	self.borderStyle = UITextBorderStyleRoundedRect;
	self.textColor = [UIColor colorWithWhite:0.180f alpha:1.0f];
	self.font = [UIFont systemFontOfSize:15.0f];
	self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	self.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.autocorrectionType = UITextAutocorrectionTypeNo;
	self.keyboardType = UIKeyboardTypeURL;
	self.returnKeyType = UIReturnKeyGo;
	self.clearButtonMode = UITextFieldViewModeWhileEditing;
	self.enablesReturnKeyAutomatically = YES;
	self.rightViewMode = UITextFieldViewModeUnlessEditing;
	
	// Background view
	[self insertSubview:self.barBackgroundView aboveSubview:[[self subviews] objectAtIndex:0]];
	
	// Refresh button
	self.rightView = self.reloadButton;
	
	self.loading = NO;
}

@end
