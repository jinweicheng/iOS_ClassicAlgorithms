//
//  main.m
//  AppearOnceData
//
//  Created by mac on 2019/10/8.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

// 1、数组只出现一次的数据
int XOROperation(NSArray *array)
{
    int result = 0;
    for (int i = 0; i < array.count; i++) {
        result ^= [array[i] intValue];
    }
    return result;
}

// 2、数组出现二个的数据
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 2、5、5
        // 10
        // 101 ->111
        // 101 -> 010
        
        
        // 2、3、5、6、6、5 -> 2 3 -> 01
        // 10
        // 11       result// 01
        // 101      result// 100
        // 110      result// 010
        // 110      result// 100
        // 101      result// 001
        
        // 5、2、8、9、9、8 -> 5 2 -> 0111
        // 101 10 1000 1001 1001 1000
        // 111 1000 1001 1001 1000
        // 1111 1001 1001 1000
        // 0110 1001 1000
        // 1111 1000
        // 0111

        
        
        
        NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"5",@"4",@"8",@"9",@"9",@"8",@"5",@"3",@"4",nil];
        NSLog(@"%d",XOROperation(array1.copy));
        
        
//      NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"2",@"3",@"5",@"6",@"6",@"5",nil];
//      NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"5",@"2",@"8",@"9",@"9",@"8",nil];
        NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"5",@"4",@"8",@"9",@"9",@"8",@"5",@"3",@"4",@"2",nil];
        NSLog(@"%@",findOnceValues(array2.copy));

    }
    return 0;
}
