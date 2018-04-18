//
//  sharedInstanceClass.h
//  BlockTest
//
//  Created by gaobin on 15/8/14.
//  Copyright (c) 2015年 gaobin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sharedInstanceClass : NSObject
+ (sharedInstanceClass *)sharedInstance;
- (NSInteger )totalnumber;
@end
