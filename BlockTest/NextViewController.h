//
//  NextViewController.h
//  BlockTest
//
//  Created by gaobin on 15-8-12.
//  Copyright (c) 2015年 gaobin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^countBlock)(NSInteger x);

@protocol NextViewControllerdelegate<NSObject>

- (void)addALabelnum:(NSInteger )count;

@end
@interface NextViewController : UIViewController

@property (nonatomic, assign) id<NextViewControllerdelegate>delegate;
@property (nonatomic,assign) NSInteger count;

@property (nonatomic, copy) countBlock mCountBlock;
@end
