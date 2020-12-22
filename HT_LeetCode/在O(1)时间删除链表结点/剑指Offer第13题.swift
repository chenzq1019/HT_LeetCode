//
//  在O(1)时间删除链表结点.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/21.
//

import Foundation

func testDeleNodeMain() -> Void {
    var node1 : ListNode? = ListNode(1)
    var node2 : ListNode? = ListNode(2)
    var node3 : ListNode? = ListNode(3)
    var node4 : ListNode? = ListNode(4)
    var node5 : ListNode? = ListNode(5)
    
    node1!.next = node2
    node2!.next = node3
    node3!.next = node4
    node4!.next = node5
    
    DeletNode(node1, deletNode: &node5)
    
    var head : ListNode? = node1
    
    while head != nil {
        print(head!.val)
        head = head!.next
    }
}

func DeletNode(_ listNode : ListNode? , deletNode:inout ListNode?) -> Void {
    guard deletNode != nil else {
        return
    }
    //如果是中间节点
    if let node = deletNode?.next {
        deletNode?.val = node.val
        deletNode?.next = node.next
    }else if listNode === deletNode {
      //如果头结点
        deletNode = nil
    }else {
        var head = listNode
        while head?.next !== deletNode {
            head = head?.next
        }
        head?.next = nil
        deletNode = nil
    }
    
    
  
}
