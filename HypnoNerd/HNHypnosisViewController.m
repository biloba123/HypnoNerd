//
// Created by 吕晴阳 on 2018/9/2.
// Copyright (c) 2018 Lv Qingyang. All rights reserved.
//

#import "HNHypnosisViewController.h"
#import "HNHypnosisView.h"

@interface HNHypnosisViewController () <UITextFieldDelegate>
@end

@implementation HNHypnosisViewController {

}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"Hypnosis";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno"];
    }
    return self;
}

- (void)loadView {
    HNHypnosisView *hypnosisView = [HNHypnosisView new];
    self.view = hypnosisView;

    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"red", @"green", @"blue"]];
    [segmentedControl addTarget:self
                         action:@selector(rgbSegmentClick:)
               forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame = CGRectMake(20, 40, 160, 20);

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 70, 240, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.enablesReturnKeyAutomatically = YES;
    textField.delegate = self;
    [hypnosisView addSubview:textField];
    [hypnosisView addSubview:segmentedControl];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"HNHypnosisViewController %s", sel_getName(_cmd));
}

- (void)rgbSegmentClick:(UISegmentedControl *)segmentedControl {
    HNHypnosisView *hypnosisView = (HNHypnosisView *) self.view;
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            [hypnosisView setCircleColor:[UIColor redColor]];
            break;
        case 1:
            [hypnosisView setCircleColor:[UIColor greenColor]];
            break;
        case 2:
            [hypnosisView setCircleColor:[UIColor blueColor]];
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self drawHypnoticText:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)drawHypnoticText:(NSString *)text {
    for (int i = 0; i < 20; ++i) {
        UILabel *label = [UILabel new];
        label.text = text;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        [label sizeToFit];

        double x = arc4random() % (int) (self.view.frame.size.width - label.frame.size.width);
        double y = arc4random() % (int) (self.view.frame.size.height - label.frame.size.height);
        CGRect rect=label.frame;
        rect.origin = CGPointMake(x, y);
        label.frame=rect;
        [self.view addSubview:label];
    }
}

@end