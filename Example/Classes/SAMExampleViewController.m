//
//  SAMExampleViewController.m
//  SAMAddressBar
//
//  Created by Sam Soffes on 7/10/13.
//  Copyright (c) 2013 Sam Soffes. All rights reserved.
//

#import "SAMExampleViewController.h"
#import "SAMAddressBar.h"
#import "SAMAddressBarTextField.h"
#import "SAMWebView.h"

@interface SAMExampleViewController () <UITextFieldDelegate>
@property (nonatomic, readonly) SAMAddressBar *addressBar;
@end

@implementation SAMExampleViewController

#pragma mark - Accessors

@synthesize addressBar = _addressBar;


- (SAMAddressBar *)addressBar {
	if (!_addressBar) {
		_addressBar = [[SAMAddressBar alloc] init];
		_addressBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		_addressBar.textField.delegate = self;
	}
	return _addressBar;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationController.navigationBarHidden = YES;

	self.view.backgroundColor = [UIColor colorWithRed:0.851f green:0.859f blue:0.882f alpha:1.0f];
	self.toolbarHidden = NO;

	CGSize size = self.view.frame.size;

	self.addressBar.frame = CGRectMake(0.0f, 0.0f, size.width, 58.0f);
	[self.view addSubview:self.addressBar];

	self.webView.frame = CGRectMake(0.0f, 58.0f, size.width, size.height - 58.0f);

	[self.addressBar.textField.reloadButton addTarget:self.webView action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
	[self.addressBar.textField.stopButton addTarget:self.webView action:@selector(stopLoading) forControlEvents:UIControlEventTouchUpInside];

	[self.webView loadURLString:@"http://soff.es"];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
	}
	return YES;
}


//#pragma mark - UITextFieldDelegate
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//	[[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(_removeGrayView) object:nil];
//
//	// Gray Button
//	//	UIButton *aGrayButton = [UIButton buttonWithType:UIButtonTypeCustom];
//	//	aGrayButton.frame = _webView.frame;
//	//	aGrayButton.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
//	//	aGrayButton.alpha = 0.0f;
//	//	aGrayButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//	//	[aGrayButton addTarget:textField action:@selector(resignFirstResponder) forControlEvents:UIControlEventTouchDown];
//	//	self.grayButton = aGrayButton;
//	//	[self.view addSubview:grayButton];
//	//	[grayButton fadeIn];
//}
//
//
//- (void)textFieldDidEndEditing:(UITextField *)textField {
//	//	[self performSelector:@selector(_removeGrayView) withObject:nil afterDelay:0.1];
//}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[self.webView loadURLString:textField.text];
	[textField resignFirstResponder];
	return YES;
}


#pragma mark - SAMWebViewDelegate

- (void)webViewDidStartLoadingPage:(SAMWebView *)aWebView {
	[super webViewDidStartLoadingPage:aWebView];

	self.addressBar.textField.loading = YES;
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

	NSString *urlString = self.webView.lastRequest.mainDocumentURL.absoluteString;

	self.addressBar.textField.text = urlString;
	self.addressBar.titleLabel.text = urlString;
}


- (void)webViewDidFinishLoadingPage:(SAMWebView *)aWebView {
	[super webViewDidFinishLoadingPage:aWebView];

	self.addressBar.textField.loading = NO;
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

	NSString *title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
	if (title) {
		self.addressBar.titleLabel.text = title;
	}
}


- (void)webView:(SAMWebView *)aWebView didFailLoadWithError:(NSError *)error {
	[super webView:aWebView didFailLoadWithError:error];
	
	self.addressBar.textField.loading = NO;
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
