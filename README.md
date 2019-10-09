## 一、日常经典算法：

* 1-1、数组中出现一次数据问题。
* 1-2、逆波兰表达式。
* 1-3、合并有序链表。


## 二、代码

#### 2-1、数组中出现一次数据问题。

 测试数据(找到规律:数组中只出现一次的数据就是所有数据异或的结果)
 ```
 
        // 测试数组数据:2、5、5
        // 10
        // 101 ->111
        // 101 -> 010
        
        // 测试数组数据:2、3、5、6、6、5 -> 2 3 -> 01
        // 10
        // 11   -> 01
        // 101  -> 100
        // 110  -> 010
        // 110  -> 100
        // 101  -> 001
        
        // 测试数组数据:5、2、8、9、9、8 -> 5 2 -> 0111
        // 101 
        // 10    ->111
        // 1000  ->1111
        // 1001  ->0110
        // 1001  ->1111
        // 1000  ->0111
``` 
 
* 数组中只有一个数据出现一次，其他数据都出现二次
    
```
int XOROperation(NSArray *array)
{
    int result = 0;
    for (int i = 0; i < array.count; i++) {
        result ^= [array[i] intValue];
    }
    return result;
}
```
* 数组中只有二个数据出现一次，其他数据都出现二次
```
NSArray * findOnceValues(NSArray *array)
{
    if (array.count <= 2) {
        return array;
    }

    // 1、异或数组中所有的数据
    NSMutableArray *onceValues = [NSMutableArray array];
    int result = XOROperation(array);
    
    // 2、找出二进制中最低为1的位置
    int temp = 1,index = 0;
    while ((result & temp) > 0) {
        temp = temp << 1;
        index = 0;
    }
    // 得到最低位是1，其他为0的二进制数据
    result &= 1 << index;
    
    // 3、根据最低位为1的值进行数据分组
    NSMutableArray *array1 = [NSMutableArray array];
    NSMutableArray *array2 = [NSMutableArray array];
    for(int i = 0;i < array.count;i++) {
        if ((result & [array[i] intValue]) > 0) {
            [array1 addObject:array[i]];
        }else{
            [array2 addObject:array[i]];
        }
    }
    int num1 = XOROperation(array1);
    int num2 = XOROperation(array2);
    
    [onceValues addObject:[NSString stringWithFormat:@"%d",num1]];
    [onceValues addObject:[NSString stringWithFormat:@"%d",num2]];
    return onceValues.copy;
}
```

#### 1-2、逆波兰表达式
```
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"10", @"6", @"9", @"3", @"+", @"-11", @"*", @"/", @"*", @"17", @"+", @"5", @"+", nil];
        for (int i = 0; i < array.count ; i++) {
            if ([array[i] isEqualToString:@"+"] || [array[i] isEqualToString:@"-"] ||
                [array[i] isEqualToString:@"*"] || [array[i] isEqualToString:@"/"]) {
                
                NSString *top1 = [stack2 cw_pop];
                NSString *top2 = [stack2 cw_pop];
                if ([array[i] isEqualToString:@"+"]) {
                    NSInteger result = [top2 integerValue] + [top1 integerValue];
                    [stack2 cw_push:[NSString stringWithFormat:@"%ld",result]];
                }else if ([array[i] isEqualToString:@"-"]){
                    NSInteger result = [top2 integerValue] - [top1 integerValue];
                    [stack2 cw_push:[NSString stringWithFormat:@"%ld",result]];
                }else if ([array[i] isEqualToString:@"*"]){
                    NSInteger result = [top2 integerValue] * [top1 integerValue];
                    [stack2 cw_push:[NSString stringWithFormat:@"%ld",result]];
                }else if ([array[i] isEqualToString:@"/"]){
                    NSInteger result = [top2 integerValue] / [top1 integerValue];
                    [stack2 cw_push:[NSString stringWithFormat:@"%ld",result]];
                }
            }else{
                [stack2 cw_push:array[i]];
            }
        }
        NSLog(@"result=%@",[stack2 cw_pop]);
```
