//
//  ViewController.m
//  BlockTest
//
//  Created by gaobin on 15-8-12.
//  Copyright (c) 2015年 gaobin. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "sharedInstanceClass.h"
#import <objc/runtime.h>

#import "BlockTest-Swift.h"

typedef void  (^BoolBlock)(BOOL);
typedef int (^intBlock)(void);
typedef BoolBlock (^hugeBlock)(intBlock);


@interface ViewController ()<NextViewControllerdelegate>
{
    NSInteger num;
}

@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatButton];
    [self creatBlock];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 50)];
    _label.numberOfLines = 0;
    _label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_label];
    
}

- (void)creatButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor grayColor];
    btn.frame = CGRectMake(100, 100, 150, 50);
  
    [btn setTitle:@"NextVC" forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

}

- (void)btnAction{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NextViewController *nextVC = [storyBoard instantiateViewControllerWithIdentifier:@"NextViewController"];
//
////    Ivar userNameIvar = class_getInstanceVariable([nextVC class],"_userName");
//    NSString *userName = nil;//object_getIvar(nextVC, userNameIvar);
//
//    swiftFunc *swifttext = [[swiftFunc alloc] init];
//    userName = [swifttext printfStringWithA:@"aaabbbccc"];
//
//
//    nextVC.delegate = self;
    nextVC.count = num;
    nextVC.mCountBlock = ^(NSInteger x) {
        [self addALabelnum:x];
        NSLog(@"%ld",(long)x);
    };
    [self presentViewController:nextVC animated:YES completion:nil];
    NSLog(@"点击NextVC按钮");
    
//    SecondViewController *secondVC = [[SecondViewController alloc] init];
//    [self presentViewController:secondVC animated:YES completion:nil];


}

- (void)addALabelnum:(NSInteger)count{
    num = count + 1;
    [[sharedInstanceClass sharedInstance] totalnumber];
    
    if (count == 0) {
        _label.text = @"你知道，就算大雨让整座城市颠倒，我会给你怀抱";
        
    }else if (count == 1) {
        _label.text = @"就算大雨让整座城市颠倒，我会给你怀抱";
        
    }else if(count == 2){
        _label.text = @"自在飞花轻似梦，无边丝雨细如愁。";
    }else{
        _label.text = @"就算大雨让整座城市颠倒，我会给你怀抱.............";
        
    }
    if(num == 4){
        num = 0;
    }
    [_label sizeToFit];

    
}

- (void)creatBlock {
    void (^printBlock)() = ^(){
        printf("no zuo no die");
    };
    printBlock();
    printBlock(9);
    
    
    int mutiplier = 7;
    int (^myBlock)(int) = ^(int num){
        return num * mutiplier;
    };
   int newMutiplier = myBlock(3);
    printf("newMutiplier is %d",newMutiplier);
    
    [self someMethod];
    [self foo];
}

- (void)someMethod {
    BoolBlock ablock = ^(BOOL bValue) {
        NSLog(@"BOOL Block");
    };
    ablock(YES);
    
}


- (BoolBlock)foo {
    BoolBlock ablock = ^(BOOL bValue) {
        NSLog(@"Bool block!");
        
    };
    return ablock;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
