//
//  UIImage+exchangeImage.m
//  RuntimeDemo
//
//  Created by Zemel on 2018/8/8.
//  Copyright © 2018年 Zemel. All rights reserved.
//

#import "UIImage+exchangeImage.h"
#import <objc/message.h>
@implementation UIImage (exchangeImage)
+ (UIImage *)ZM_imageNamed:(NSString *)imageName
{
    UIImage * tempImage = [UIImage ZM_imageNamed:imageName];
    if (tempImage) {
        NSLog(@"图片加载完成");
    }else{
        NSLog(@"图片加载失败");
    }
    return tempImage;
}

/**
 把类加载进内存的时候调用，只会调用一次
 */
+ (void)load
{
    //获取源方法的地址
    Method sourceImp = class_getClassMethod(self, @selector(imageNamed:));
    //获取目的方法的地址
    Method desImp = class_getClassMethod(self, @selector(ZM_imageNamed:));
    //交换方法
    method_exchangeImplementations(sourceImp, desImp);
}
/*
 不能在分类里面重写系统方法，因为会覆盖掉。也不能调用super
+ (UIImage *)imageNamed:(NSString *)name
{
    
}
 */
@end
