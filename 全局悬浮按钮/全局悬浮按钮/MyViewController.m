//
//  MyViewController.m
//  全局悬浮按钮
//
//  Created by 迟国强 on 2017/5/27.
//  Copyright © 2017年 设立公司. All rights reserved.
//

#import "MyViewController.h"
#import "MyWindow.h"
@interface MyViewController ()
{
    MyWindow *win;
}
@end

@implementation MyViewController
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self performSelector:@selector(setNew) withObject:nil afterDelay:2];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wholebtn:) name:@"wholebtn" object:[self class]];

    // Do any additional setup after loading the view from its nib.
}
- (void)wholebtn:(NSNotification *)notification{
    
}
//-(void)setNew
//
//{
//    
//    win= [[MyWindow alloc] initWithFrame:CGRectMake(20,440,60,60)];
//    win.windowLevel=UIWindowLevelAlert+1;
//    
//    //这句话很重要
//    [win becomeKeyWindow];
////    [win makeKeyAndVisible];
//
//    
//}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
