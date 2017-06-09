//
//  ViewController.m
//  全局悬浮按钮
//
//  Created by 迟国强 on 2017/5/27.
//  Copyright © 2017年 设立公司. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"
#import "MyWindow.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wholebtn:) name:@"wholebtn" object:[MyViewController class]];//如果想在此页面操作全局按钮做两步1，添加通知 2，注意 object 这样才能调用成功
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 180, 50);
    [btn setTitle:@"点击跳转到下一页面" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //界面消失时就可以移除，
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
- (void)wholebtn:(NSNotification *)notification{
        MyViewController *vc = [[MyViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    //移除悬浮按钮
//    NSDictionary *dic = notification.userInfo;
//    MyWindow *window = (MyWindow *)dic[@"window"];
////    [window.button removeFromSuperview];
//    [window resignKeyWindow];
//    window = nil;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)jump{
    MyViewController *vc = [[MyViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
