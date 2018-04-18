//
//  sharedInstanceClass.m
//  BlockTest
//
//  Created by gaobin on 15/8/14.
//  Copyright (c) 2015年 gaobin. All rights reserved.
//

#import "sharedInstanceClass.h"

@interface sharedInstanceClass()
{
    NSInteger count;
}
@end


@implementation sharedInstanceClass

+ (sharedInstanceClass *)sharedInstance{
    
    static sharedInstanceClass *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (!sharedInstance) {
            sharedInstance = [[self alloc]init];
        }
    });
    return sharedInstance;
}

- (id)init{

    self = [super init];
    if(self){
    }
    return self;
}

- (NSInteger )totalnumber{

    return count;
}

@end
