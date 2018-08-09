//
//  NSObject+ExtentionName.m
//  RuntimeDemo
//
//  Created by Zemel on 2018/8/8.
//  Copyright © 2018年 Zemel. All rights reserved.
//

#import "NSObject+ExtentionName.h"
#import <objc/message.h>


@implementation NSObject (ExtentionName)
- (NSString *)name
{
    //利用参数key，把对应属性中的值取出来
//    objc_getAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>)
    return objc_getAssociatedObject(self, @"name");
    
}
- (void)setName:(NSString *)name
{
    //将值与对象关联起来
    //参数1:类，给哪个对象添加属性
    //参数2:参数名称
    //参数3:值
    //参数4:保存策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
