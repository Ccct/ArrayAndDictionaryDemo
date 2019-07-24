//
//  ViewController.m
//  ArrayAndDictionaryDemo
//
//  Created by Helios on 2019/7/24.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //https://www.cnblogs.com/liuxiaokun/p/5544812.html
    //看到第 20
    
}

/**
 NSArray是不可变的，NSMutableArray是可变的，而且只能储存Object-c对象，
 数组的最后一个元素一定是《nil》表示结束,这些集合类只能收集cocoa对象（NSOjbect对象），
 如果想保存一些原始的C数据（例如，int, float, double, BOOL等），则需要将这些原始的C数据封装成NSNumber类型
 */
- (void)Methond{
    
    //初始化
    NSArray *array1 = [NSArray arrayWithObjects:@"one", @"two", nil];
    
    //追加对象
    [array1 arrayByAddingObject:@"demo"];
    
    NSLog(@"-- 追加对象 : %@",array1);
    
    //追加数组
    [array1 arrayByAddingObjectsFromArray:@[@"11",@"22"]];
     
    NSLog(@"-- 追加数组 : %@",array1);
    
    //分割数组为字符串
    [array1 componentsJoinedByString:@","];
    
    NSLog(@"-- 分割数组为字符串 : %@",array1);
    
    //判断数组是否存在指定元素
    BOOL isContain = [array1 containsObject:@"one"];
    
    NSLog(@"-- 判断数组是否存在指定元素 : %d",isContain);
    
    //格式化为一个属性列表
    NSString *desStr = [array1 description];
    
    NSLog(@"-- 格式化为一个属性列表 : %@",desStr);
    
    //取出array1对象跟array2对象第一个交集元素
    NSArray *array2 = @[@"one",@"two",@"three",@"four"];
    NSString *obj = [array1 firstObjectCommonWithArray:array2];
    NSLog(@"-- 取出array1对象跟array2对象第一个交集元素 : %@",obj);
    
    //返回指定区域的对象
    NSArray *tempArr = [array1 subarrayWithRange:NSMakeRange(0, 0)];
    NSLog(@"返回指定区域的对象 :%@", tempArr);

    //获取指定元素的索引
    NSUInteger tag = [array1 indexOfObject:@"two"];
    NSLog(@"获取指定元素的索引 :%lu", (unsigned long)tag);
    
    NSUInteger tags = [array1 indexOfObjectIdenticalTo:@"two"];
    NSLog(@"获取指定元素的索引 :%lu", (unsigned long)tags);
    
    //指定区域获取元素的索引
    NSUInteger tag1 =[array1 indexOfObject:@"three" inRange:NSMakeRange(0, 0)];
    NSLog(@"指定区域获取元素的索引 :%lu", (unsigned long)tag1);
    
    NSUInteger tagss = [array1 indexOfObjectIdenticalTo:@"two" inRange:NSMakeRange(0, 0)];
    NSLog(@"指定区域获取元素的索引 :%lu", (unsigned long)tagss);
    
    //判断二个数组对象是否相等
    BOOL equalArr = [array1 isEqualToArray:array2];
    NSLog(@"判断二个数组对象是否相等 %d",equalArr);
    
    //取出数组最后一个元素、第一个元素
    NSString *lastObj = [array1 lastObject];
    NSString *firstObj = [array1 firstObject];
    NSLog(@"最后一个元素 %@、第一个元素 %@",lastObj,firstObj);
    
    //返回一个枚举对象
    NSEnumerator *enumberators = [array1 objectEnumerator];
    NSLog(@"返回一个枚举对象 %@",enumberators);
    
    //返回一个翻转的枚举对象
    NSEnumerator *enumberatorss = [array1 reverseObjectEnumerator];
    NSLog(@"返回一个翻转的枚举对象 %@",enumberatorss);
}


@end
