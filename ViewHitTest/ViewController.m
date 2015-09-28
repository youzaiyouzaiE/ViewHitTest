//
//  ViewController.m
//  ViewHitTest
//
//  Created by jiahui on 15/9/25.
//  Copyright © 2015年 YouZai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UIButton *underButton;
   
    __weak IBOutlet UIView *onView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    sub2View.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(id)sender {
     NSLog(@"button touch");
}

- (IBAction)tapGestureRecognizer:(UITapGestureRecognizer *)sender {
    
    CGPoint point = [sender locationInView:onView];
    NSLog(@"tap in OnView X:%f ,Y:%f",point.x,point.y);
}

@end

@implementation MyView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    [super hitTest:point withEvent:event];
    UIButton *underButton = (UIButton *)[self viewWithTag:1];
    CGPoint buttonTuchPoint = [self convertPoint:point toView:underButton];
    if ([underButton pointInside:buttonTuchPoint withEvent:event]) {///
        return underButton;
    } else {
        return [super hitTest:point withEvent:event];///点击事件位置在别的地方，交给父类处理
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    UIView *onView = [self viewWithTag:2];
    CGPoint _point = [self convertPoint:point toView:onView];
    if ([onView pointInside:_point withEvent:event]) {
        return YES;
    }
    return NO;
}

@end