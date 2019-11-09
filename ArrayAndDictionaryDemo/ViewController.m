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
    //整理思路： 初始化、增、删、改、遍历、对比
}

/**
 NSArray是不可变的，NSMutableArray是可变的，而且只能储存Object-c对象，
 数组的最后一个元素一定是《nil》表示结束,这些集合类只能收集cocoa对象（NSOjbect对象），
 如果想保存一些原始的C数据（例如，int, float, double, BOOL等），则需要将这些原始的C数据封装成NSNumber类型
 */
#pragma mark - Array
- (void)ArrayMethond{
    
    //初始化
    NSArray *array1 = [NSArray arrayWithObjects:@"one",@"two",@"three",@"four", nil];
    NSArray *array1s = @[@"one",@"two"];
    
    //???
//    NSArray *array2 = [[NSArray alloc] initWithObjects:@"" count:2];
    
    //??? 深拷贝 浅拷贝
    NSArray *array3 = [[NSArray alloc] initWithArray:array1 copyItems:YES];
    
    //文件加载数据
    NSArray *array4 = [NSArray arrayWithContentsOfFile:@""];
    NSArray *array4s = [[NSArray alloc] initWithContentsOfFile:@""];
    
    //从网络地址加载数据
    NSArray *array5 = [NSArray arrayWithContentsOfURL:[NSURL URLWithString:@""]];
    NSArray *array5s = [[NSArray alloc] initWithContentsOfURL:[NSURL URLWithString:@""]];
    
    
    
    
    //  增
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
    
    //升序排序数组元素
    [[array1 sortedArrayHint] description];
    NSLog(@"升序排序数组元素 %@",enumberatorss);
    
    // ???
    //调用指定方法排序数组元素
//    array1 sortedArrayUsingFunction:<#(nonnull NSInteger (*)(id  _Nonnull __strong, id  _Nonnull __strong, void * _Nullable))#> context:<#(nullable void *)#>

    // ???
    //调用指定方法排序数组元素
//    array1 sortedArrayUsingFunction:<#(nonnull NSInteger (*)(id  _Nonnull __strong, id  _Nonnull __strong, void * _Nullable))#> context:<#(nullable void *)#> hint:<#(nullable NSData *)#>

    // ???
    //指定比较方法排序数据元素
//    array1 sortedArrayUsingSelector:@selector(<#selector#>)

    
    //保存数组对象到指定文件
    [array1 writeToFile:@"filePath.xml" atomically:YES];
    
    //保存数组对象到指定URL
    [array1 writeToURL:[NSURL URLWithString:@"url"] atomically:YES];
    
    // ???
    //每个数组元素都调用指定方法
//    [array1 makeObjectsPerformSelector:@selector()];
    
//    [array1 makeObjectsPerformSelector:@selector() withObject:@""];
    
    //指定索引集合返回新数组
    NSArray *temArr = [array1 objectsAtIndexes:[NSIndexSet indexSetWithIndex:0]];
    NSLog(@"指定索引集合返回新数组 %@",temArr);
    
    //返回指定索引数组元素
    NSArray *temArr1 = [array1 objectAtIndexedSubscript:2];
    NSLog(@"返回指定索引数组元素 %@",temArr1);
    
    //快速遍历 1
    [array1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"idx: %lu,obj: %@",(unsigned long)idx,obj);
    }];
    
    //快速遍历 2
    NSMutableArray *myArray = [NSMutableArray arrayWithObjects:@"a", @"ab",  @"abc", nil];
    NSMutableArray *myArrayCount = [NSMutableArray arrayWithCapacity:1];
    
    //参数NSEnumerationConcurrent：底层通过GCD来处理并发执行事宜，具体实现可能会用到dispatch group。也就是说，这个会用多线程来并发实现，并不保证按照顺序执行，但效率肯定是杠杠的！
    //参数NSEnumerationReverse ： 倒序便利（按顺序）
    [myArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        
         [myArrayCount addObject:[NSNumber numberWithInt:[obj length]]];
    }];
    NSLog(@"%@", myArrayCount);
    
    // ???
    //快速遍历 3
    NSString *area = @"Asia";
    NSArray *timeZoneNames = [NSTimeZone knownTimeZoneNames];
    NSMutableArray *areaArray = [NSMutableArray arrayWithCapacity:1];
    //indexesOfObjectsWithOptions 返回通过指定枚举选项的代码块方法的元素索引集
    NSIndexSet *areaIndexes = [timeZoneNames indexesOfObjectsWithOptions:NSEnumerationConcurrent
                                                             passingTest:^(id obj, NSUInteger idx, BOOL *stop) {
                                                                 
                                                                 NSString  *tmpStr = (NSString *)obj;
                                                                 return [tmpStr hasPrefix:area];
                                                             }];
    
    [timeZoneNames enumerateObjectsAtIndexes:areaIndexes options:NSEnumerationConcurrent|NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx,BOOL *stop) {
        
        [areaArray addObject:[obj substringFromIndex:[area length]+1]];
    }];
    NSLog(@"Cities in %@ time zone:%@", area, areaArray);
    
    
    // ???
    //数组第一个元素对象执行代码块方法（测试用）
    __block BOOL ifTrue = NO;
    NSUInteger *testUInteger;
    testUInteger = [myArray indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop){
        
        if([obj isEqual:@"ab"]){
            ifTrue = YES;
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    NSLog(@"%lu", testUInteger);
    
    //???
    //返回通过代码块方法测试的元素索引
    NSUInteger *passingTest;
    passingTest = [myArray indexOfObjectWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop)
                   {
                       if([obj isEqual:@"a"] == NO) {
                           *stop = YES;
                           return YES;
                       }
                       return NO;
                   }];
    NSLog(@"%lu", passingTest);
    
    //???
    //返回通过代码块方法测试的元素索引集第一个索引
    NSUInteger *passingTestFirst;
    passingTestFirst = [timeZoneNames indexOfObjectAtIndexes:areaIndexes options: NSEnumerationConcurrent passingTest:
                        ^BOOL(id obj, NSUInteger idx, BOOL *stop) {
                            if([[obj substringFromIndex:[area length]+1] isEqualToString: @"Aden"]) {
                                *stop = YES;
                                return idx;
                            }
                            return NO;
                        }];
    NSLog(@"%lu", passingTestFirst);
    
    //???
    //返回通过代码块方法测试的元素索引集
    NSIndexSet *areaIndexs = [timeZoneNames indexesOfObjectsPassingTest:
                              ^(id obj, NSUInteger idx, BOOL *stop)
                              {
                                  NSString  *tmpStr = (NSString *)obj;
                                  return [tmpStr hasPrefix:area];
                              }];
    NSLog(@"%@", areaIndexs);
    
    //返回通过指定【索引集合《=》枚举选项】的代码块方法的元素索引集
    NSIndexSet *areaTwoIndexs = [timeZoneNames indexesOfObjectsAtIndexes:areaIndexs options:NSEnumerationConcurrent passingTest:^(id obj, NSUInteger idx, BOOL * stop){
        
         return  [[obj substringFromIndex:[area length]+1] hasPrefix:@"A"];
    }];
    NSLog(@"%@", areaTwoIndexs);
    
    
    //返回指定对比方法升序数组
//    NSArray *demoArray = [NSArray arrayWithObjects:@"53", @"22", @"31",  nil];
    NSArray *demoArray = [NSArray arrayWithObjects:@"53", @"22", @"31",  nil];
    NSArray *sortArray = [demoArray sortedArrayUsingComparator:^(id objOne, id objTwo){
        
        int oneUInteger = [objOne intValue];
        int twoUInteger = [objTwo intValue];
        if(oneUInteger > twoUInteger) {
          return (NSComparisonResult)NSOrderedDescending;
        }
        if(oneUInteger < twoUInteger) {
          return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSLog(@"%@", sortArray);
    
    
    //返回指定对比方法升序数组
    NSArray *sortedArray = [demoArray sortedArrayWithOptions:NSSortStable usingComparator:^(id objOne , id objTwo){
        
        return[objOne compare:objTwo];
    }];
    NSLog(@"%@", sortedArray);
    
    
    //binary search指定区域返回通过代码块方法的索引
    NSUInteger amount = 9000;
    NSNumber* number = [NSNumber numberWithInt:724];
    NSMutableArray* anArray = [NSMutableArray arrayWithCapacity:amount];
    for (NSUInteger i = 0; i < amount; ++i) {;
        [anArray addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    NSUInteger index1 = [anArray indexOfObject:number
                                 inSortedRange:NSMakeRange(0, [anArray count])
                                       options:NSBinarySearchingFirstEqual
                               usingComparator:^(id obj1,id obj2) {
                                   
                                   NSInteger iVal1 = [obj1 integerValue];
                                   NSInteger iVal2 = [obj2 integerValue];
                                   if (iVal1 < iVal2)
                                       return NSOrderedAscending;
                                   else if (iVal1 > iVal2)
                                       return NSOrderedDescending;
                                   else
                                       return NSOrderedSame;
                               }];
    NSLog(@"%lu", index1);
}

#pragma mark - MutableArray
- (void)MutableArrayMethond{
    
    //初始化
    NSMutableArray *mutArr1 = [[NSMutableArray alloc] initWithObjects:@"obj1",@"obj2",@"obj3",@"obj4", nil];
    NSMutableArray *mutArr1s = [[NSMutableArray alloc] initWithArray:@[@"obj1",@"obj2"] copyItems:YES];
    NSMutableArray *mutArr1ss = [[NSMutableArray alloc] initWithArray:@[@"obj1",@"obj2"]];
    
    
    //初始化化数组对象容量
    NSMutableArray *demoOneCapacity = [NSMutableArray arrayWithCapacity:3];
    [demoOneCapacity addObject:@"demoOne"];

    //添加对象
    [mutArr1 addObject:@"obj5"];
    
    //指定索引位置插入对象
    [mutArr1 insertObject:@"obj4s" atIndex:3];
    
    //移除对象
    [mutArr1 removeObject:@"obj2"];
    
    [mutArr1 removeObjectAtIndex:0];
    
    //删除所有对象
    [mutArr1 removeAllObjects];
    
    //移除最后一个对象
    [mutArr1 removeLastObject];
    
    //替换指定索引位置对象
    [mutArr1 replaceObjectAtIndex:2 withObject:@"ddddd"];
    
    //追加数组A到数组B
    NSMutableArray * demoMutableArray = [[NSMutableArray alloc] initWithObjects:@"January", @"February", @"March", nil];
    NSMutableArray * demoTwoMutableArray = [NSMutableArray arrayWithObject:@"April"];
    [demoMutableArray  addObjectsFromArray:demoTwoMutableArray];
    NSLog(@"%@", [demoMutableArray description]);
    
    //交换指定索对象的位置
    [demoMutableArray exchangeObjectAtIndex:1 withObjectAtIndex:3];
    NSLog(@"%@", [demoMutableArray description]);
    
    //移除指定区域指定对象.根据对象isEqual消息判断
    [demoMutableArray removeObject:@"March" inRange:NSMakeRange(1, 3)];
    NSLog(@"移除指定区域指定对象.根据对象isEqual消息判断 %@", [demoMutableArray description]);
    
    //移除指定区域指定对象,根据对象的地址判断
    [demoMutableArray removeObjectIdenticalTo:@"April" inRange:NSMakeRange(0, 3)];
    NSLog(@"移除指定区域指定对象,根据对象的地址判断 %@", [demoMutableArray description]);
    
    //移除指定对象
    [demoMutableArray removeObjectIdenticalTo:@"January"];
    NSLog(@"移除指定对象 %@", [demoMutableArray description]);
    
    //移除数组A包含的指定数组B元素
    [demoMutableArray removeObjectsInArray:demoTwoMutableArray];
    NSLog(@"移除数组A包含的指定数组B元素 %@", [demoMutableArray description]);
    
    //移除指定区域所有对象
    [demoMutableArray removeObjectsInRange:NSMakeRange(1, 2)];
    NSLog(@"移除指定区域所有对象 %@", [demoMutableArray description]);
    
    //指定(数组B的指定区域）的元素替换（数组A指定区域）
    NSMutableArray * demoThreeMutableArray = [NSMutableArray arrayWithObjects:@"May", @"June",  @"July", nil];
    [demoMutableArray replaceObjectsInRange:NSMakeRange(1, 3) withObjectsFromArray:demoThreeMutableArray range:NSMakeRange(2, 1)];
    NSLog(@"指定(数组B的指定区域）的元素替换（数组A指定区域） %@", [demoMutableArray description]);
    
    //指定数组B替换（数组A指定区域）的元素
    [demoMutableArray replaceObjectsInRange:NSMakeRange(1, 1) withObjectsFromArray:demoThreeMutableArray];
    NSLog(@"指定数组B替换（数组A指定区域）的元素 %@", [demoMutableArray description]);
    
    //指定数组B替换A
    NSMutableArray * demoMutableArrays = [NSMutableArray arrayWithObjects:@"January", @"February", @"March", nil];
    NSArray *demoArray = [NSArray arrayWithObjects:@"April", @"May",  nil];
    [demoMutableArrays setArray:demoArray];
    NSLog(@"指定数组B替换A %@", demoMutableArrays);
    
    //???
    //指定方法升序比较
//    mutArr1 sortUsingFunction:<#(nonnull NSInteger (*)(id  _Nonnull __strong, id  _Nonnull __strong, void * _Nullable))#> context:<#(nullable void *)#>
    
    //指定方法升序比较
//    mutArr1 sortUsingSelector:@selector()
    
    //指定索引集合插入数组元素
    [demoMutableArray insertObjects:demoArray atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(3, 2)]];
    NSLog(@"指定索引集合插入数组元素 %@", demoMutableArray);
    
    //移除指定索引集合元素
    [demoMutableArray removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)]];
    NSLog(@"移除指定索引集合元素 %@", demoMutableArray);
    
    //替换指定索引集合的数组元素
    [demoMutableArray replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, 2)] withObjects:demoArray];
    NSLog(@"替换指定索引集合的数组元素 %@", demoMutableArray);
    
    //指定索引替换新的数组元素
    [demoMutableArray setObject:demoArray atIndexedSubscript:3];
    NSLog(@"指定索引替换新的数组元素 %@", demoMutableArray);
    
    //指定块方法排序数组元素
    NSMutableArray * demoThreeArray = [[NSMutableArray alloc] initWithObjects:@"23", @"3", @"13", nil];
    [demoThreeArray sortUsingComparator: ^(id objOne, id objTwo) {
        
        NSInteger intOne = [objOne integerValue];
        NSInteger intTwo = [objTwo integerValue];
        if (intOne> intTwo) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if (intOne < intTwo) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSLog(@"指定块方法排序数组元素 %@", demoThreeArray);
    
    //指定块比较数组
    [demoThreeArray sortWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id objOne, id objTwo) {
        NSInteger intOne = [objOne integerValue];
        NSInteger intTwo = [objTwo integerValue];
        if (intOne> intTwo) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        if (intOne < intTwo) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSLog(@"指定块比较数组 %@", demoThreeArray);
}

@end
