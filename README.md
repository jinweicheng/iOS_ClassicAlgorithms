## 一、日常经典算法：

* 1-1、数组中出现一次数据问题。
* 1-2、逆波兰表达式。
* 1-3、合并有序链表。
* 1-4、反转链表。
* 1-5、交换二维数组的行列数据。


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
------------

#### 2-2、逆波兰表达式
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
------------

#### 2-3、合并有序的链表

```
// 根据元素查找插入的下标(有序的链表插入)
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

//  合并二个有序的链表
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

// 合并k个有序的链表
CWLinkedList * margeKList(NSMutableArray *linkedLists)
{
    // 1、找到最长的list
    CWLinkedList *maxList = linkedLists[0];
    for (CWLinkedList *list in linkedLists) {
        if (maxList.size < list.size) {
            maxList = list;
        }
    }
    [linkedLists removeObject:maxList];

    // 2、遍历其他链表insert
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


```

#### 2-4、反转链表

```
/**
 反转链表(遍历一遍，每一次都添加新元素在头部,新增了一个链表，空间复杂度较高)
*/
- (CWLinkedList *)reverseLinkList
{
    CWLinkedList *list = self->_first;
    CWLinkedList *resultList = [[CWLinkedList alloc] init];
    while(list != nil){
        [resultList cw_addE:list->ele index:0];
        list = list->next;
    }
    return resultList;
}

/**
 反转链表优化方案(遍历一遍，只是改变next的指针)
*/
- (CWLinkedList *)good_reverseLinkList
{
    CWLinkedList *headList = self->_first;
    CWLinkedList *preList = [[CWLinkedList alloc] init];
    while(headList != nil){
        // 保存下一节点
        CWLinkedList *temp = headList->next;
        // 修改next的指向
        headList->next = preList;
        // 实时修改preList的节点内容
        preList = headList;
        // 修改headList的内容
        headList = temp;
    }
    return preList;
}
```


#### 2-5、交换二维数组的行列数据

`参考图片`

![image](https://github.com/jinweicheng/iOS_ClassicAlgorithms/blob/master/Resource_Image/交换二维数组行列数据1.png)
![image](https://github.com/jinweicheng/iOS_ClassicAlgorithms/blob/master/Resource_Image/交换二维数组行列数据2.png)

```
按照对象线分为三部分，1）对角线右边(i-j>0),2）对角线(i-j<0),3）对角线左边(i-j=0)

关键代码
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
```
------------
