//
//  main.m
//  Leetcode_206(反转链表)
//
//  Created by mac on 2019/11/5.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWLinkedList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // 初始化链表
        CWLinkedList *link = [[CWLinkedList alloc] init];
        [link cw_addE:@"4"];
        [link cw_addE:@"6"];
        [link cw_addE:@"8"];
        [link cw_addE:@"10"];
        [link cw_addE:@"12"];
        NSLog(@"%@",link);
        
        // 反转链表
//        link = [link reverseLinkList];
        link = [link good_reverseLinkList];

        
    }
    return 0;
}
