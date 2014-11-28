//
//  ViewController.m
//  bootUpScreen
//
//  Created by 阿部 竜之介 on 2014/10/23.
//  Copyright (c) 2014年 RyunosukeAbe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self time];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(time)
                                           userInfo:nil
                                            repeats:YES];
    
    UIImage *backgroundImage  = [UIImage imageNamed:@"slide.png"];
    slide.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    UIImage *backgroundImage2  = [UIImage imageNamed:@"lock.png"];
    lock.backgroundColor = [UIColor colorWithPatternImage:backgroundImage2];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [slide addGestureRecognizer:pan];
    
    NSLog(@"通ったよ！");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)time{
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    
    flags = NSWeekdayCalendarUnit |  NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
    comps = [calendar components:flags fromDate:now];
    
    NSInteger weekday = comps.weekday;
    NSInteger month = comps.month;
    NSInteger day = comps.day;
    NSInteger hour = comps.hour;
    NSInteger minute = comps.minute;
    
    NSLog(@"%f",slide.center.x);
//    NSString *week;
//    
//    switch (weekday) {
//        case 1:
//            week = @"日";
//            break;
//        case 2:
//            week = @"月";
//            break;
//        case 3:
//            week = @"火";
//            break;
//        case 4:
//            week = @"水";
//            break;
//        case 5:
//            week = @"木";
//            break;
//        case 6:
//            week = @"金";
//            break;
//        case 7:
//            week = @"土";
//            break;
//            
//        default:
//            break;
//    }
    
    NSArray *weekArray = @[@"日",@"月",@"火",@"水",@"木",@"金",@"土"];
    
    time.text = [NSString stringWithFormat:@"%d:%02d",hour,minute];
    date.text = [NSString stringWithFormat:@"%d月%d日(%@曜日)",month,day,weekArray[weekday-1]];
    
}

-(void)panAction:(UIPanGestureRecognizer *)sender{
    
    if ([sender state] == UIGestureRecognizerStateEnded){
        if(slide.center.x > 240){
            // 画面遷移
            [UIView animateWithDuration:0.5 // 0.2秒かけてアニメーション
                             animations:^
             {
                 CGRect headerFrame = headerView.frame;
                 headerFrame.origin.y = -150; // 右に100移動
                 headerView.frame = headerFrame;
                 
                 CGRect dateFrame =date.frame;
                 dateFrame.origin.y = -150;
                 date.frame = dateFrame;
                 
                 CGRect timeFrame =time.frame;
                 timeFrame.origin.y = -150;
                 time.frame = timeFrame;
                 
                 
                 
                 CGRect footerFrame = footerView.frame;
                 footerFrame.origin.y = 150; // 右に100移動
                 footerView.frame = footerFrame;
                 
                 CGRect slideFrame =slide.frame;
                 slideFrame.origin.y = 150;
                 slide.frame = slideFrame;
                 
                 CGRect lockFrame =lock.frame;
                 lockFrame.origin.y = 150;
                 lock.frame = lockFrame;
                 
                 CGRect unlockFrame =unlockLabel.frame;
                 unlockFrame.origin.y = 150;
                 unlockLabel.frame = unlockFrame;
                 
             }];
        }else{
            [UIView animateWithDuration:0.2 // 0.2秒かけてアニメーション
                             animations:^
             {
                 CGRect frame = slide.frame;
                 frame.origin.x = 0; // 右に100移動
                 slide.frame = frame;
             }];
        }
    }else if(35 < slide.center.x && slide.center.x < 242.5){
        
        CGPoint st = [sender translationInView:self.view];
            CGPoint movePoint = CGPointMake(slide.center.x + st.x, slide.center.y);
            slide.center = movePoint;
        [sender setTranslation:CGPointZero inView:self.view];
        [self.view bringSubviewToFront:slide];

    }
}

@end
