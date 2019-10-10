//
//  main.m
//  Leetcode_21_23(合并有序链表)
//
//  Created by mac on 2019/10/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWLinkedList.h"

// 1、合并二个有序的链表
CWLinkedList * margeList(CWLinkedList *list1,CWLinkedList *list2)
{
    // list1的长度长
    if (list1.size >list2.size) {
        CWLinkedList *list = list2->_first;
        while (list != nil) {
            [list1 cw_insertElement:list->ele position:list1];
            list = list->next;
        }
        NSLog(@"%@",list1);
        return list1;
    }
    // list2的长度长
    else{
        CWLinkedList *list = list1->_first;
        while (list != nil) {
            [list2 cw_insertElement:list->ele position:list2];
            list = list->next;
        }
        NSLog(@"%@",list2);
        return list2;
    }
}

// 2、合并k个有序的链表
CWLinkedList * margeKList(NSMutableArray *linkedLists)
{
    // 2-1、找到最长的list
    CWLinkedList *maxList = linkedLists[0];
    for (CWLinkedList *list in linkedLists) {
        if (maxList.size < list.size) {
            maxList = list;
        }
    }
    [linkedLists removeObject:maxList];
    
    // 2-2、遍历其他链表insert
    for (int i = 0; i < linkedLists.count; i++) {
        CWLinkedList *list = linkedLists[i];
        list = list->_first;
        while (list != nil) {
            [maxList cw_insertElement:list->ele position:maxList];
            list = list->next;
        }
    }
    NSLog(@"%@",maxList);
    return maxList;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
//        CWLinkedList *list = [[CWLinkedList alloc] init];
//        [list cw_addE:@"3"];
//        [list cw_addE:@"8"];
//        [list cw_addE:@"13"];
//        [list cw_addE:@"23"];
//        [list cw_addE:@"43"];
//        [list cw_addE:@"103"];
//        [list cw_addE:@"183"];
//        [list cw_addE:@"243"];
//        [list cw_addE:@"278"];
//        NSLog(@"list1=%@",list);
//
//        CWLinkedList *list2 = [[CWLinkedList alloc] init];
//        [list2 cw_addE:@"2"];
//        [list2 cw_addE:@"5"];
//        [list2 cw_addE:@"7"];
//        [list2 cw_addE:@"33"];
//        [list2 cw_addE:@"53"];
//        [list2 cw_addE:@"66"];
//        NSLog(@"list2=%@",list2);
//        margeList(list, list2);
        
        
        
        
        CWLinkedList *list3 = [[CWLinkedList alloc] init];
        [list3 cw_addE:@"3"];
        [list3 cw_addE:@"8"];
        [list3 cw_addE:@"13"];
        [list3 cw_addE:@"23"];
        [list3 cw_addE:@"43"];
        [list3 cw_addE:@"103"];
        [list3 cw_addE:@"183"];
        [list3 cw_addE:@"243"];
        [list3 cw_addE:@"278"];
        NSLog(@"list1=%@",list3);
        
        CWLinkedList *list4 = [[CWLinkedList alloc] init];
        [list4 cw_addE:@"2"];
        [list4 cw_addE:@"5"];
        [list4 cw_addE:@"279"];
        NSLog(@"list2=%@",list4);
        
        CWLinkedList *list5 = [[CWLinkedList alloc] init];
        [list5 cw_addE:@"9"];
        [list5 cw_addE:@"33"];
        [list5 cw_addE:@"553"];
        NSLog(@"list2=%@",list5);
        NSMutableArray *array = [NSMutableArray arrayWithObjects:list3,list4,list5,nil];
        margeKList(array);
        
    }
    return 0;
}
