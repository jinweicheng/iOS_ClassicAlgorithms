//
//  main.m
//  Array(Exchange-Low-Col)
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

// 打印结果
void printResult(NSMutableArray *array,int n){
    for(int i = 0;i < n; i++){
        NSString *rowString = @"";
        for(int j = 0; j < n; j++){
            rowString = [rowString stringByAppendingFormat:@"%@ ",array[i][j]];
        }
        NSLog(@"%@",rowString);
    }
    NSLog(@"\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       

        
        // 1-1、3*3矩阵初始化
        NSLog(@"--------------------3*3--------------------");
        int n1 = 3;
        NSMutableArray *array1 = [NSMutableArray arrayWithObjects:
                                  [NSMutableArray arrayWithObjects:@1,@2,@3,nil],
                                  [NSMutableArray arrayWithObjects:@4,@5,@6,nil],
                                  [NSMutableArray arrayWithObjects:@7,@8,@9, nil]];
        
        printResult(array1, 3);
        
        
        // 1-2、交换行列数据
        for(int i = 0;i < n1; i++){
            for(int j = 0; j < n1; j++){
                // 属于对角线右边部分
                if(i - j > 0){
                    NSNumber *temp = array1[i][j];
                    array1[i][j] = array1[j][i];
                    array1[j][i] = temp;
                }
            }
        }
        // 1-3、打印结果
        printResult(array1,3);
        
        
        
        // 2、4*4矩阵
        NSLog(@"--------------------4*4--------------------");
        int n2 = 4;
        NSMutableArray *array2 = [NSMutableArray arrayWithObjects:
                                  [NSMutableArray arrayWithObjects:@1,@2,@3,@4,nil],
                                  [NSMutableArray arrayWithObjects:@5,@6,@7,@8,nil],
                                  [NSMutableArray arrayWithObjects:@9,@10,@11,@12,nil],
                                  [NSMutableArray arrayWithObjects:@13,@14,@15,@16, nil]];
        printResult(array2, n2);
        
        for(int i = 0;i < n2; i++){
            for(int j = 0; j < n2; j++){
                // 属于对角线右边部分
                if(i - j > 0){
                    NSNumber *temp = array2[i][j];
                    array2[i][j] = array2[j][i];
                    array2[j][i] = temp;
                }
            }
        }
        printResult(array2, n2);
        
        
        
        
        
    }
    return 0;
}
