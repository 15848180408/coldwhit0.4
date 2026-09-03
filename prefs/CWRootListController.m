#import <UIKit/UIKit.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CoreFoundation/CoreFoundation.h>

@interface CWRootListController : PSListController
@end

@implementation CWRootListController

- (NSMutableArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] mutableCopy];
    }
    return _specifiers;
}

- (NSNumber *)temperatureForSpecifier:(PSSpecifier *)specifier {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"com.chatgpt.coldwhite"];
    if (![defaults objectForKey:@"temperature"]) return @0;
    return @([defaults doubleForKey:@"temperature"]);
}

- (void)setTemperature:(NSNumber *)value forSpecifier:(PSSpecifier *)specifier {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"com.chatgpt.coldwhite"];
    [defaults setDouble:value.doubleValue forKey:@"temperature"];
    [defaults synchronize];
    CFNotificationCenterPostNotification(
        CFNotificationCenterGetDarwinNotifyCenter(),
        CFSTR("com.chatgpt.coldwhite.changed"), NULL, NULL, true);
}

- (void)resetTemperature {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"com.chatgpt.coldwhite"];
    [defaults setDouble:0 forKey:@"temperature"];
    [defaults synchronize];
    CFNotificationCenterPostNotification(
        CFNotificationCenterGetDarwinNotifyCenter(),
        CFSTR("com.chatgpt.coldwhite.changed"), NULL, NULL, true);
    [self reloadSpecifiers];
}

@end
