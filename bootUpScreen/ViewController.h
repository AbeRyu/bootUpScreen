//
//  ViewController.h
//  bootUpScreen
//
//  Created by 阿部 竜之介 on 2014/10/23.
//  Copyright (c) 2014年 RyunosukeAbe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    IBOutlet UIView *headerView;
    IBOutlet UILabel *time;
    IBOutlet UILabel *date;
    
    IBOutlet UIView *footerView;
    IBOutlet UIView *lock;
    IBOutlet UIView *slide;
    IBOutlet UILabel *unlockLabel;
    
    UIView *blackView;
    NSTimer *timer;
}

-(void)panAction:(UIPanGestureRecognizer *)sender;



@end

