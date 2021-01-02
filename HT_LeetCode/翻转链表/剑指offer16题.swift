//
//  剑指offer16题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/22.
//



import Foundation

/**
 * 题目：定义一个函数，输入一个链表的头结点，反转该链表并输出反转链表的头结点。
 */

func testJianzhiOffer16() -> Void {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    
    node1.next = node2
    node2.next = node3
    node3.next = node4

    let head = reverseListNode(node: node1)
    printListNode(node: head)
    
}

func reverseListNode(node: ListNode?) -> ListNode? {
    //定义一个临时节点
    var tempNode : ListNode? = nil
    var head : ListNode? = node
    while head != nil {
        //1、首先获取下一个节点，并暂时保存
        let next = head?.next
        //2、将当前节点的下一个节点指向一个临时节点
        head?.next = tempNode
        //3、将当前节点赋给临时节点
        tempNode = head
        //3、下一个节点赋给头结点，进入下一次循环
        head = next
    }
    return tempNode
}

func printListNode( node: ListNode?) -> Void {
    var head = node
    while head != nil {
        print(head!.val )
        head = head?.next
    }
}
