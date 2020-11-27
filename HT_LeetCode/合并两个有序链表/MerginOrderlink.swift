//
//  MerginOrderlink.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/27.
//

import Foundation
/**
 * 题目： 给定两个有序的链表，将其合并成一个有序的链表
 *
 */

func testMergeTwoList() -> Void {
    //
    
    let listOne = ListNode(1)
    let listOne2 =  ListNode(2)
    let listOne3 =  ListNode(4)
    
    let listTwo = ListNode(1)
    let listTwo2 = ListNode(3)
    let listTwo3 = ListNode(5)
    
    listOne.next = listOne2
    listOne2.next = listOne3
    
    listTwo.next = listTwo2
    listTwo2.next = listTwo3
    
    var newList = mergeTwoList(l1: listOne, l2: listTwo)
    
    while newList != nil {
        print(newList?.val ?? "")
        newList = newList?.next
    }
}

func mergeTwoList(l1: ListNode?, l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    var newlist : ListNode? = ListNode(0)
    let headNode = newlist
    var list1 = l1
    var list2 = l2
    while list1 != nil && list2 != nil {
        if let a = list1?.val,let b = list2?.val, a >= b {
            newlist?.next = list2
            list2 = list2?.next
        }else {
            newlist?.next = list1
            list1 = list1?.next
        }
        newlist = newlist?.next
    }
    if list1 != nil {
        newlist?.next = list1
    }
    if list2 != nil {
        newlist?.next = list2
    }
    return headNode?.next
}
