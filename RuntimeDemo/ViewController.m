//
//  ViewController.m
//  RuntimeDemo
//
//  Created by 赵敏 on 2018/8/8.
//  Copyright © 2018年 Zemel. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+exchangeImage.h"
#import "NSObject+ExtentionName.h"
#import "NextViewController.h"
#import "TestModel.h"
#import <objc/message.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imgView.image = [UIImage ZM_imageNamed:@"hello"];
//    self.imgView.image = [UIImage imageNamed:@"hello"];
    
    NSObject * obj = [[NSObject alloc] init];
    obj.name = @"Extension Name";
    NSLog(@"动态添加属性:%@",obj.name);
    
//    [self getAllProperty];
//    [self getAllMethod];
    
    
    
}
- (IBAction)nextHandle:(id)sender {
    NextViewController * vc = [[NextViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

/**
 获取某个类的所有属性
 */
- (void)getAllProperty
{
    unsigned int count = 0;
    objc_property_t * propertyList = class_copyPropertyList([TestModel class], &count);
    for (int i=0; i<count; i++) {
        const char * propertyName = property_getName(propertyList[i]);
        NSLog(@"所有属性:%@",[NSString stringWithUTF8String:propertyName]);
    }
}

/**
 获取某个类的所有方法
 */
- (void)getAllMethod
{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList([TestModel class], &count);
    for (int i=0; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"所有方法:%@",NSStringFromSelector(method_getName(method)));
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
