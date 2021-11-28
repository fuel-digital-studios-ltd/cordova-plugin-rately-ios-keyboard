#import "CDVCustomKeyboard.h"

// Define the class, and of what it is a subclass
@interface CDVCustomKeyboard ()<UITextViewDelegate>

@property (nonatomic, readwrite, assign) BOOL keyboardIsVisible;

@end

@implementation CDVCustomKeyboard

UITextView *nativeTextView;
CDVInvokedUrlCommand *command;


- (IBAction)doneBtnFromKeyboardClicked:(id)sender {
	//Hide Keyboard by endEditing
//	NSLog(@"oplog CDVCustomKeyboard.m: doneBtnFromKeyboardClicked");
	[self.viewController.view endEditing:YES];
	[self close:(CDVInvokedUrlCommand*)command];
}
	

- (void)pluginInitialize {
//    if (nativeTextView == NULL) {
//		 NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize called, nativeTextView == NULL");
//
//		float screenWidth;
//		float screenHeight;
//		float xBox;
//		float yBox;
//		float boxWidth;
//		float boxHeight;
//		screenWidth = self.webView.bounds.size.width;
//		screenHeight = self.webView.bounds.size.height;
//		xBox = screenWidth * 0.05;
//		yBox = screenHeight * 0.15;
//		boxWidth = screenWidth * 0.9;
//		boxHeight = screenHeight * 0.4;
//
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: screenWidth = %f", screenWidth);
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: screenHeight = %f", screenHeight);
//
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: xBox = %f", xBox);
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: yBox = %f", yBox);
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: boxWidth = %f", boxWidth);
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: boxHeight = %f", boxHeight);
//
//		// CGRect textViewFrame = CGRectMake(35.0f, 85.0f, 350.0f, 110.0f);
//		CGRect textViewFrame = CGRectMake(xBox, yBox, boxWidth, boxHeight);
//
//		nativeTextView = [[UITextView alloc] initWithFrame:textViewFrame];
//		[nativeTextView setFont:[UIFont systemFontOfSize:18]];
//		nativeTextView.textColor = [UIColor darkGrayColor];
//		nativeTextView.tintColor = [UIColor darkGrayColor];
//        nativeTextView.keyboardType = UIKeyboardTypeTwitter;
//        [nativeTextView setHidden:YES];
//		nativeTextView.delegate = self;
//        [self.viewController.view addSubview:nativeTextView];
//
//        // Add 'Done' button
//		UIToolbar *ViewForDoneButtonOnKeyboard = [[UIToolbar alloc] init];
//		[ViewForDoneButtonOnKeyboard sizeToFit];
//		UIBarButtonItem *btnDoneOnKeyboard = [[UIBarButtonItem alloc] initWithTitle:@"Done"
//			style:UIBarButtonItemStylePlain target:self
//			action:@selector(doneBtnFromKeyboardClicked:)];
//		[ViewForDoneButtonOnKeyboard setItems:[NSArray arrayWithObjects:btnDoneOnKeyboard, nil]];
//		nativeTextView.inputAccessoryView = ViewForDoneButtonOnKeyboard;
//    } else {
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize called, nativeTextView !== NULL");
//	}
}


- (void)textViewDidChange:(UITextView *)nativeTextView {
//	NSLog(@"oplog CDVCustomKeyboard.m: textViewDidChange called");
	NSString *text = nativeTextView.text;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:text];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
}


- (void)textViewDidEndEditing:(UITextView *)nativeTextView {
//	NSLog(@"oplog CDVCustomKeyboard.m: textViewDidEndEditing called");
    NSString *text = nativeTextView.text;
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:text];
	[pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult  callbackId:self.callbackId];
//    nativeTextView.editable = NO;
}


- (void)textViewDidBeginEditing:(UITextView *)nativeTextView {
//	NSLog(@"oplog CDVCustomKeyboard.m: textViewDidBeginEditing called");
	NSString *text = nativeTextView.text;
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:text];
	[pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult  callbackId:self.callbackId];
    nativeTextView.editable = YES;
}


- (void)prepare:(CDVInvokedUrlCommand*)command {
//	NSLog(@"oplog CDVCustomKeyboard.m: prepare called");
	
	if (nativeTextView == NULL) {
		 NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize called, nativeTextView == NULL");

		float screenWidth;
		float screenHeight;
		float xBox;
		float yBox;
		float boxWidth;
		float boxHeight;
		screenWidth = self.webView.bounds.size.width;
		screenHeight = self.webView.bounds.size.height;
		xBox = screenWidth * 0.05;
		// yBox = screenHeight * 0.15;
//		yBox = 70;
		if (@available( iOS 11.0, * )) {
			if ([[[UIApplication sharedApplication] keyWindow] safeAreaInsets].bottom > 0) {
				// iPhone with notch, heigh of toolbar is 88px
				yBox = 90;
			} else {
				// iPhone with no notch, heigh of toolbar is 64px
				yBox = 66;
			}
		}
		boxWidth = screenWidth * 0.9;
		boxHeight = screenHeight * 0.15;
		
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: screenWidth = %f", screenWidth);
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: screenHeight = %f", screenHeight);
//
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: xBox = %f", xBox);
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: yBox = %f", yBox);
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: boxWidth = %f", boxWidth);
//		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize: boxHeight = %f", boxHeight);
		
		// CGRect textViewFrame = CGRectMake(35.0f, 85.0f, 350.0f, 110.0f);
		CGRect textViewFrame = CGRectMake(xBox, yBox, boxWidth, boxHeight);

		nativeTextView = [[UITextView alloc] initWithFrame:textViewFrame];
		[nativeTextView setFont:[UIFont systemFontOfSize:18]];
		nativeTextView.textColor = [UIColor colorNamed:@"H10PostText"];
		nativeTextView.tintColor = [UIColor colorNamed:@"H10PostText"];
        nativeTextView.keyboardType = UIKeyboardTypeTwitter;
        nativeTextView.backgroundColor = [UIColor colorNamed:@"H10TextBoxBackground"];
//		nativeTextView.backgroundColor = [UIColor clearColor];

        [nativeTextView setHidden:YES];
		nativeTextView.delegate = self;
        [self.viewController.view addSubview:nativeTextView];
		
        // Add 'Done' button
		UIToolbar *ViewForDoneButtonOnKeyboard = [[UIToolbar alloc] init];
		[ViewForDoneButtonOnKeyboard sizeToFit];
		UIBarButtonItem *btnDoneOnKeyboard = [[UIBarButtonItem alloc] initWithTitle:@"Done"
			style:UIBarButtonItemStylePlain target:self
			action:@selector(doneBtnFromKeyboardClicked:)];
		[ViewForDoneButtonOnKeyboard setItems:[NSArray arrayWithObjects:btnDoneOnKeyboard, nil]];
		nativeTextView.inputAccessoryView = ViewForDoneButtonOnKeyboard;
    } else {
		NSLog(@"oplog CDVCustomKeyboard.m: pluginInitialize called, nativeTextView !== NULL");
	}
	
	self.startedValue = [command argumentAtIndex:0];
//	NSLog(@"%@", self.startedValue);
	self.callbackId = command.callbackId;
	[self open:(CDVInvokedUrlCommand*)command];
	nativeTextView.editable = YES;
}


- (void)setScreenOrientation:(CDVInvokedUrlCommand*)command {
	
	NSLog(@"oplog CDVCustomKeyboard.m: setScreenOrientation called");
	NSString *screenOrientationValue = [command argumentAtIndex:0];
	NSArray *orientationTypes = @[@"portrait", @"landscape"];
	int screenOrientationIntValue = [orientationTypes indexOfObject:screenOrientationValue];
	
	// Calculate the new width
	int newScreenWidth = (int) [[UIScreen mainScreen] bounds].size.width;
	int leftGap = newScreenWidth * 0.075;
	int newWidth = newScreenWidth * 0.925;
	
	switch (screenOrientationIntValue) {
		case 0: {
			// Portrait
			[nativeTextView setFrame:CGRectMake(leftGap, 100.0f, newWidth, 100.0f)];
			break;
		}
		case 1: {
			// Landscape
			[nativeTextView setFrame:CGRectMake(leftGap, 90.0f, newWidth, 60.0f)];
			break;
		}
	}
}


- (void)open:(CDVInvokedUrlCommand*)command{
//	NSLog(@"oplog CDVCustomKeyboard.m: open called");
	self.startedValue = [command argumentAtIndex:0];
    nativeTextView.text = self.startedValue;
//	nativeTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    [nativeTextView setHidden:NO];
    [nativeTextView becomeFirstResponder];
    nativeTextView.editable = YES;
    [self textViewDidBeginEditing:(UITextView *)nativeTextView];
}


- (void)hideTextBox:(CDVInvokedUrlCommand*)command {
//	NSLog(@"oplog CDVCustomKeyboard.m: hideTextBox called");
	[nativeTextView setHidden:YES];
}


- (void)revealTextBox:(CDVInvokedUrlCommand*)command {
//	NSLog(@"oplog CDVCustomKeyboard.m: revealTextBox called");
	[nativeTextView setHidden:NO];
}


- (void)close:(CDVInvokedUrlCommand*)command {
//	NSLog(@"oplog CDVCustomKeyboard.m: close called");
	CDVPluginResult* pluginResult = nil;
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:nativeTextView.text];
	[pluginResult setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
	[nativeTextView resignFirstResponder];
}


@end
