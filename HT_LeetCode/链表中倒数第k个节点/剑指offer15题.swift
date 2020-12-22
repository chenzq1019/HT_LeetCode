//
//  剑指offer15题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/22.
//

import Foundation
/**
 * 题目：输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数。
 *
 * 分析：如和找到倒数第k个节点，我们通常直观想法是遍历这个链表，看这个链表一共有多少个节点。然后找出倒数第k个几点。
 * 但是，这个通常需要遍历至少两次才行，这个不是我们想要的算法。
 *
 * 我们可以通过快慢指针的方法。设置两个指针，一个指针指向第k个元素，一个指向第0个，然后两个指针同时向前移动，直到第一个指针指向空的时候，第二个指针所指的节点就是倒数第k个节点了。
 **/

func testJianzhiOffer15() -> Void {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    let node6 = ListNode(6)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    
    let findNode = findKthToTail(list: node1, k: 5)
    if let n = findNode {
        print(n.val)
    }
}

fileprivate func findKthToTail(list: ListNode?,k : Int) -> ListNode?{
    if list == nil || k < 0 {
        return nil
    }
    var findNode: ListNode? = nil
    var fastNode: ListNode? = list
    var slowNode: ListNode? = list
    var p = k
    while p > 0 {
        fastNode = fastNode?.next
        p -= 1
        if fastNode == nil && p > 0 {
            return nil
        }
    }
    while fastNode != nil {
        fastNode = fastNode?.next
        slowNode = slowNode?.next
    }
    findNode = slowNode
    return findNode
}
