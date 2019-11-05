//
//  CWLinkedList.h
//  Leetcode_21_23(合并有序链表)
//
//  Created by mac on 2019/10/9.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWLinkedList : NSObject
{
    @public
    id ele;                     // 元素
    CWLinkedList *next;           // 下一个指针
    CWLinkedList *_first;         // first指针
}

@property (nonatomic,assign)  int size;     /**< 链表子节点数目 */

/**
 1、新增某元素
 */
- (void)cw_addE:(id)E;

/**
 2、新增某个index下新增元素
 */
- (void)cw_addE:(id)E index:(int)index;

/**
 3、根据元素查找下标
 */
- (int)cw_indexOf:(id)E;

/**
 4、根据元素查找插入的下标
 */
- (CWLinkedList *)cw_insertElement:(id)insertE position:(CWLinkedList *)node;

/**
 5、反转链表
 */
- (CWLinkedList *)reverseLinkList;

- (CWLinkedList *)good_reverseLinkList;


@end
