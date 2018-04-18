//
//  NextViewController.m
//  BlockTest
//
//  Created by gaobin on 15-8-12.
//  Copyright (c) 2015年 gaobin. All rights reserved.
//

#import "NextViewController.h"
#import "ViewController.h"

@interface NextViewController ()
{
    
    @private
    NSString *_userName;
}
@end

@implementation NextViewController

- (void)viewDidLoad {
    NSLog(@"_userName: %@", _userName);
    _userName = @"返回上一页";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNextBtn];

}

- (NSInteger)count {
    if (!_count) {
        _count = 0;
    }
    return _count;
}

- (void)creatNextBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake(100, 200, 200, 50);
    [btn setTitle:_userName forState:UIControlStateNormal];
    [btn setTintColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(backToForce) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)backToForce{
    if ([self.delegate respondsToSelector:@selector(addALabelnum:)]) {
        [self.delegate addALabelnum:self.count];
    }
    if (self.mCountBlock) {
        self.mCountBlock(self.count);

    }
    self.count ++ ;

    [self dismissViewControllerAnimated:YES completion:nil];
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
