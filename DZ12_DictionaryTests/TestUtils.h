//
// Created by Maya on 2/4/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestUtils : NSObject
+ (NSMutableArray *) loadRawDataArray;

+ (void)performBlock:(void (^)())pFunction nTimes:(int)times;
@end