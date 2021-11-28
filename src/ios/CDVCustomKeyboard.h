#import <Cordova/CDVPlugin.h>

@interface CDVCustomKeyboard : CDVPlugin {
}
@property (nonatomic, copy) NSString* callbackId;
@property (nonatomic, copy) NSString* inputId;
@property (nonatomic, copy) NSString* startedValue;
@property (nonatomic) UIKeyboardType keyboardType;
@property (nonatomic) CDVInvokedUrlCommand* command;

- (void)open:(CDVInvokedUrlCommand*)command;
- (void)prepare:(CDVInvokedUrlCommand*)command;
- (void)setScreenOrientation:(CDVInvokedUrlCommand*)command;
- (void)hideTextBox:(CDVInvokedUrlCommand*)command;
- (void)revealTextBox:(CDVInvokedUrlCommand*)command;
- (void)close:(CDVInvokedUrlCommand*)command;
@end
