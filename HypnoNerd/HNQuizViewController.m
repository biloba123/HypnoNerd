//
//  HNQuizViewController.m
//  Quiz
//
//  Created by 吕晴阳 on 2018/8/31.
//  Copyright © 2018年 Lv Qingyang. All rights reserved.
//

#import "HNQuizViewController.h"

@interface HNQuizViewController ()
@property(nonatomic) int currentQuestionIndex;
@property(nonatomic, copy) NSArray *questions;
@property(nonatomic, copy) NSArray *answers;

@property(nonatomic, weak) IBOutlet UILabel *questionLabel;
@property(nonatomic, weak) IBOutlet UILabel *answerLabel;
@end

@implementation HNQuizViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil
                         bundle:(nullable NSBundle *)nibBundleOrNil {
    NSLog(@"%s", sel_getName(_cmd));
    if (self = [super initWithNibName:nibBundleOrNil bundle:nibBundleOrNil]) {
        _questions = @[@"埋在地下一千年的酒，出来以后叫什么?",
                @"有一只猪，它走啊走啊，走到了英国,结果他变成了什么?",
                @"上课老师抽查背课文,小猪,小狗,小猫都举手了,老师会叫谁?",
                @"蝴蝶, 蚂蚁, 蜘蛛, 蜈蚣,他们一起工作,最后哪一个没有领到酬劳?"];
        _answers = @[@"酒精",
                @"Pig",
                @"小狗，因为旺旺仙贝",
                @"蜈蚣，因为无功不受禄"];
        _currentQuestionIndex = 0;

        self.tabBarItem.title=@"Quiz";
        self.tabBarItem.image= [UIImage imageNamed:@"Quiz"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", sel_getName(_cmd));
//    self.questionLabel.lineBreakMode=NSLineBreakByWordWrapping;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%s", sel_getName(_cmd));
    // Dispose of any resources that can be recreated.
}

- (IBAction)showQuestion:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
    _currentQuestionIndex++;
    _currentQuestionIndex %= [_questions count];
    _questionLabel.text=_questions[_currentQuestionIndex];
    _answerLabel.text=@"？？？";
}

- (IBAction)showAnswer:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
    _answerLabel.text=_answers[_currentQuestionIndex];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
