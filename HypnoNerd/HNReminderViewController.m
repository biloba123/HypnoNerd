//
// Created by 吕晴阳 on 2018/9/3.
// Copyright (c) 2018 Lv Qingyang. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import "HNReminderViewController.h"

@interface HNReminderViewController ()
@property(nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation HNReminderViewController {

}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"Reminder";
        self.tabBarItem.image = [UIImage imageNamed:@"Time"];
    }

    return self;
}

- (IBAction)reminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"%s %@", sel_getName(_cmd), date);

    [[UNUserNotificationCenter currentNotificationCenter]
            requestAuthorizationWithOptions:UNAuthorizationOptionBadge|UNAuthorizationOptionAlert
                          completionHandler:^(BOOL granted, NSError *error){
                              NSLog(@"%s %@", sel_getName(_cmd), granted);
                              if(granted){
                                  UNMutableNotificationContent *content = [UNMutableNotificationContent new];
                                  content.body = @"Hypnotize me!";
                                  UNNotificationRequest *request = [UNNotificationRequest
                                          requestWithIdentifier:@"123"
                                                        content:content
                                                        trigger:[UNTimeIntervalNotificationTrigger
                                                                triggerWithTimeInterval:[date timeIntervalSinceNow]
                                                                                repeats:NO]];
                                  NSLog(@"%s %f", sel_getName(_cmd), [date timeIntervalSinceNow]);
                                  [[UNUserNotificationCenter currentNotificationCenter]
                                          addNotificationRequest:request
                                           withCompletionHandler:^(NSError *error) {
                                               NSLog(@"%@", error.localizedDescription);
                                           }];
                              }
                          }];




//    UILocalNotification *notification = [UILocalNotification new];
//    notification.alertBody = @"Hypnotize me!";
//    notification.fireDate = date;
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"HNReminderViewController %s", sel_getName(_cmd));

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", sel_getName(_cmd));
    self.datePicker.minimumDate= [NSDate dateWithTimeIntervalSinceNow:60.0];
}

@end
