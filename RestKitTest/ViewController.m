//
//  ViewController.m
//  RestKitTest
//
//  Created by Rex Fenley on 10/9/14.
//  Copyright (c) 2014 Remind101. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *boxView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.boxView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    self.boxView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.boxView];
    
    [self animateBox];
}

- (void)animateBox
{
    static NSUInteger step = 0;
    
    [UIView animateWithDuration:3.0 animations:^{
        
        CGRect frame = self.boxView.frame;
        
        switch (step)
        {
            case 0:
                frame.origin.x += 100;
                break;
            case 1:
                frame.origin.y += 100;
                break;
            case 2:
                frame.origin.x -= 100;
                break;
                
            default:
                frame.origin.y -= 100;
                break;
        }
        
        self.boxView.frame = frame;
        
    } completion:^(BOOL finished) {
        
        step++;
        
        if (step > 3)
        {
            step = 0;
        }
        
        [self animateBox];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
