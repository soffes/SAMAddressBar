//
//  SAMAddressBar.m
//  SAMAddressBar
//
//  Created by Sam Soffes on 7/10/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMAddressBar.h"
#import "SAMAddressBarTextField.h"

@implementation SAMAddressBar

@synthesize titleLabel = _titleLabel;
@synthesize textField = _textField;

- (UILabel *)titleLabel {
	if (!_titleLabel) {
		_titleLabel = [[UILabel alloc] init];
		_titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		_titleLabel.backgroundColor = [UIColor clearColor];
		_titleLabel.textColor = [UIColor colorWithRed:0.251 green:0.286f blue:0.325f alpha:1.0f];
		_titleLabel.textAlignment = NSTextAlignmentCenter;
		_titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
		_titleLabel.shadowColor = [UIColor colorWithWhite:1.0f alpha:0.5f];
		_titleLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
	}
	return _titleLabel;
}


- (SAMAddressBarTextField *)textField {
	if (!_textField) {
		_textField = [[SAMAddressBarTextField alloc] init];
		_textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	}
	return _textField;
}


- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		[self initialize];
	}
	return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self initialize];
	}
	return self;
}


- (CGSize)sizeThatFits:(CGSize)size {
	size.height = 58.0f;
	return size;
}


- (void)layoutSubviews {
	self.titleLabel.frame = CGRectMake(6.0f, 0.0f, self.bounds.size.width - 12.0f, 20.0f);
	self.textField.frame = CGRectMake(6.0f, 21.0f, self.bounds.size.width - 12.0f, 31.0f);
}


#pragma mark - Private

- (void)initialize {
	[self addSubview:self.titleLabel];
	[self addSubview:self.textField];
}

@end
