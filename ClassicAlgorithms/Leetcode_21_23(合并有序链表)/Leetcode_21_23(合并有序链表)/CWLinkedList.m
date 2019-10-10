//
//  CWLinkedList.m
//  Leetcode_21_23(合并有序链表)
//
//  Created by mac on 2019/10/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CWLinkedList.h"

@interface CWLinkedList(){
    
}
@end

@implementation CWLinkedList

/**
 0、初始化node节点
 */
- (instancetype)init{
    if (self = [super init]) {
        self.size = 0;
        self->_first = nil;
    }
    return self;
}

- (CWLinkedList *)private_initListNodeNext:(CWLinkedList *)next E:(id)E
{
    // 创建新node
    CWLinkedList *node = [[CWLinkedList alloc] init];
    node->next = next;
    node->ele = E;
    return node;
}

/**
 1、链表新增某元素
 */
- (void)cw_addE:(id)E
{
    [self cw_addE:E index:self.size];
}

/**
 2、链表新增某个index下新增元素
 */
- (void)cw_addE:(id)E index:(int)index
{
    if (index == 0) {// 添加头节点
        self->_first = [self private_initListNodeNext:_first E:E];
    }else{          // 添加中间节点，最后节点
        CWLinkedList *prevN = [self cw_getIndex:index-1];
        CWLinkedList *insertN = [self private_initListNodeNext:prevN->next E:E];
        prevN->next = insertN;
    }
    self.size++;
}

/**
 3、链表根据元素查找下标
 */
- (int)cw_indexOf:(id)E
{
    int index = 0;
    CWLinkedList *node = self->_first;
    while (node != nil) {
        if ([node->ele isEqual:E]) {
            return index;
        }
        node = node->next;
        index++;
    }
    return -1;
}

/**
 4、根据元素查找插入的下标(有序的链表插入)
 */
- (CWLinkedList *)cw_insertElement:(id)insertE position:(CWLinkedList *)node
{
    // 找到第一个大于等于insert元素的值
    int index = 0;
    CWLinkedList *list = self->_first;
    while (list != nil) {
        if ([list->ele intValue] >= [insertE intValue]) {
            [self cw_addE:insertE index:index];
            return self;
        }
        list = list->next;
        index++;
    }
    
    // 没有找到大于等于待插入的元素
    if (list == nil) {
        [self cw_addE:insertE index:self.size];
    }
    return node;
}


// private_5、根据下标查找某元素
- (id)cw_getIndex:(int)index
{
    CWLinkedList *node = self->_first;
    while (index) {
        node = node->next;
        index--;
    }
    return node;
}


- (NSString *)description
{
    NSString *temp = [NSString stringWithFormat:@"listNode:size-%d,[",self.size];
    
    CWLinkedList *node;
    for (int i = 0; i < self.size; i ++) {
        node = [self cw_getIndex:i];
        if (i == self.size -1) {
            temp = [temp stringByAppendingFormat:@"_%@",node->ele];
        }else{
            temp = [temp stringByAppendingFormat:@"_%@_, ",node->ele];
        }
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}

@end
