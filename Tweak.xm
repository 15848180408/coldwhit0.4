#import <Foundation/Foundation.h>

static NSString * const kCWDomain = @"com.chatgpt.coldwhite";
static CFStringRef const kCWNotify = CFSTR("com.chatgpt.coldwhite.changed");

static void CWChanged(CFNotificationCenterRef center, void *observer,
                      CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    // Phase 1: deliberately no display API is called here.
    // This build validates injection + preferences without relying on macOS-only Quartz APIs.
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:kCWDomain];
    (void)[defaults doubleForKey:@"temperature"];
}

%ctor {
    CFNotificationCenterAddObserver(
        CFNotificationCenterGetDarwinNotifyCenter(),
        NULL,
        CWChanged,
        kCWNotify,
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately
    );
}
