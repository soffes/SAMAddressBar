//
//  SAMAddressBarTextFieldBackgroundViewInnerView.m
//  SAMAddressBar
//
//  Created by Sam Soffes on 2/8/11.
//  Copyright 2011-2013 Sam Soffes. All rights reserved.
//

#import "SAMAddressBarTextFieldBackgroundViewInnerView.h"

@implementation SAMAddressBarTextFieldBackgroundViewInnerView

#pragma mark - UIView

- (id)initWithFrame:(CGRect)aFrame {
	if ((self = [super initWithFrame:aFrame])) {
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		self.backgroundColor = [UIColor clearColor];
		self.opaque = NO;
		self.clipsToBounds = YES;
		self.userInteractionEnabled = NO;
		self.contentMode = UIViewContentModeRedraw;
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	CGSize size = self.frame.size;
	[[UIImage imageNamed:@"SAMAddressBar-background"] drawAsPatternInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
}

@end
