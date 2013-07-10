//
//  SAMAddressBarTextFieldBackgroundView.m
//  SAMAddressBar
//
//  Created by Sam Soffes on 2/8/11.
//  Copyright 2011-2013 Sam Soffes. All rights reserved.
//

#import "SAMAddressBarTextFieldBackgroundView.h"
#import "SAMAddressBarTextFieldBackgroundViewInnerView.h"
#import <QuartzCore/QuartzCore.h>

@interface SAMAddressBarTextFieldBackgroundView ()
@property (nonatomic, readonly) SAMAddressBarTextFieldBackgroundViewInnerView *innerView;
@end

@implementation SAMAddressBarTextFieldBackgroundView

static CGFloat kLoadingBackgroundWidth = 49.0f;

@synthesize loading = _loading;
@synthesize innerView = _innerView;


- (void)setLoading:(BOOL)isLoading {
	if (_loading == isLoading) {
		return;
	}
	_loading = isLoading;

	if (_loading) {
		[self setupAnimation];
	}

	UIView *view = self.innerView;
	CGFloat alpha = _loading ? 1.0f : 0.0f;
	[UIView animateWithDuration:0.3 animations:^{
		view.alpha = alpha;
	}];
	
	[self setNeedsDisplay];
}


- (SAMAddressBarTextFieldBackgroundViewInnerView *)innerView {
	if (!_innerView) {
		_innerView = [[SAMAddressBarTextFieldBackgroundViewInnerView alloc] init];
	}
	return _innerView;
}


#pragma mark - UIView

- (id)initWithFrame:(CGRect)aFrame {
	if ((self = [super initWithFrame:aFrame])) {
		self.layer.cornerRadius = 6.0f;
		
		self.backgroundColor = [UIColor clearColor];
		self.alpha = 0.8f;
		self.opaque = NO;
		self.clipsToBounds = YES;
		self.userInteractionEnabled = NO;
		self.contentMode = UIViewContentModeRedraw;

		[self addSubview:self.innerView];
	}
	return self;
}


#pragma mark - Private Methods

- (void)setupAnimation {
	if (![self.innerView.layer animationForKey:@"translation"]) {
		self.innerView.frame = CGRectMake(0, 0, self.frame.size.width + kLoadingBackgroundWidth, self.frame.size.height);
		CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
		translation.duration = 3;
		translation.repeatCount = INFINITY;
		translation.autoreverses = NO;
		translation.fromValue = [NSNumber numberWithFloat: - kLoadingBackgroundWidth];
		translation.toValue = [NSNumber numberWithFloat: 0.0f];
		
		CAMediaTimingFunction *easeInEffect = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
		[translation setTimingFunction:easeInEffect];
		[self.innerView.layer addAnimation:translation forKey:@"translation"];
	}
}

@end
