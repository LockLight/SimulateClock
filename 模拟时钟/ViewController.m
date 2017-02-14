//
//  ViewController.m
//  模拟时钟
//
//  Created by locklight on 17/2/14.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "ViewController.h"
#import "LLClockView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}

- (void)setupUI{
    LLClockView *clockView = [[LLClockView alloc]initWithImage:[UIImage imageNamed:@"clock"]];
    clockView.center = self.view.center;
    [self.view addSubview:clockView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
