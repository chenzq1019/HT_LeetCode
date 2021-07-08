//
//  剑指Offer第37题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/6/4.
//

import Foundation


/**
 * 题目：输入两个单向链表，找出他们的第一个公共节点
 *
 *
 * 分析：两个链表如果他们有公共节点的话，那么他们最后的节点应该公用的，形状应该像Y而不是X。
 *
 * 因此，我们可以遍历连个链表，然后找到其中长的那个链表，以及长了几个节点，然后先让长链表走若干步后，两个链表再开始同时向前遍历，直到两个节点相同为止。这时就找到了第一个相同的节点了。
 *
 *
 **/


func testJianzhiOffer37() -> Void {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    
    let p1 = ListNode(10)
    let p2 = ListNode(11)
    let p3 = ListNode(12)
    let p4 = ListNode(13)
    
    p1.next = p2
    p2.next = p3
    p3.next = p4
    p4.next = node2
    let node : ListNode? = findFirstSameNode(node1, p1)
    if let find = node {
        print(find.val)
    }else{
        print("没有找到相同节点")
    }
}


fileprivate func findFirstSameNode(_ list1: ListNode?, _ list2: ListNode?) -> ListNode?{
    var tempHeader1 : ListNode? = list1
    var tempHeader2 : ListNode? = list2
    var count = 0
    var count2 = 0
    //遍历求出链表长度
    while tempHeader1 != nil {
        tempHeader1 = tempHeader1?.next
        count += 1
    }
    
    while tempHeader2 != nil {
        tempHeader2 = tempHeader2?.next
        count2 += 1
    }
    //根据长度使比较长的先移动
    var newHeader1 = list1
    if count > count2 {
        var delt = count - count2
        while delt>0 {
            newHeader1 = newHeader1?.next
            delt -= 1
        }
    }
    var newHeader2 = list2
    if count < count2 {
        var delt = count2 - count
        while delt > 0 {
            newHeader2 = newHeader2?.next
            delt -= 1
        }
    }
    //同时移动链表
    while newHeader1 != nil && newHeader2 != nil {
        if newHeader1?.val == newHeader2?.val {
            return newHeader1
        }
        newHeader1 = newHeader1?.next
        newHeader2 = newHeader2?.next
    }

    return nil
}
