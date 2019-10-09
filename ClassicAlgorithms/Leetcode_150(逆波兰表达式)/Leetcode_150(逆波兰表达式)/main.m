//
//  main.m
//  Leetcode_150(逆波兰表达式)
//
//  Created by mac on 2019/10/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWStackList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 思路:遇到运算符，pop出来二个值，进行运算，得到的结果继续存放到栈中
        CWStackList *stack2 = [[CWStackList alloc] init];
        //        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"1",@"+",@"3",@"*", nil];
        //        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"4",@"-",@"3",@"*", nil];
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
    }
    return 0;
}
