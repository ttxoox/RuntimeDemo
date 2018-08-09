//
//  TestModel.h
//  RuntimeDemo
//
//  Created by Zemel on 2018/8/8.
//  Copyright © 2018年 Zemel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject
@property (nonatomic, strong)NSMutableArray * mutableArray;
@property (nonatomic, strong)NSArray * array;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) BOOL isModel;

- (void)run;
@end
