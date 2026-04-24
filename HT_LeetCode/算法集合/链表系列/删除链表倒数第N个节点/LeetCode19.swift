//
//  LeetCode19.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2026/4/23.
//

import Foundation

func testLeeCode19() {
    let nodeList = buildChainNode(array: [1,2,3,4,5,6,7,8,9])
    
    var newList = removeNthFromEnd(head: nodeList, n: 4)
    
    while newList != nil {
        if let node = newList {
            print(node.val,"->")
        }
       
        newList = newList?.next
    }
    
}

func buildChainNode(array: [Int]) -> ListNode? {
    if array.isEmpty { return nil }
    let header = ListNode(0)
    var tempNode: ListNode = header
    for value in array {
        let node = ListNode(value)
        tempNode.next = node
        tempNode = node
    }
    return header.next
    
}

private func removeNthFromEnd(head: ListNode?, n: Int) -> ListNode? {
    //1、创建一个虚拟头
    let dummy = ListNode(0)
       dummy.next = head
   // 2. 初始化快慢指针
    var fast: ListNode? = dummy
    var slow: ListNode? = dummy
    // 3. 快指针先走 n + 1 步
    // 目的是让 slow 最终停在待删除节点的前一个位置
    for _ in 0..<n + 1 {
        fast = fast?.next
    }

    // 4. 快慢指针同时移动，直到 fast 到达链表末尾 (nil)
    while fast != nil {
        fast = fast?.next
        slow = slow?.next
    }
    // 5. 此时 slow 指向倒数第 n+1 个节点
    // 执行删除操作：跳过倒数第 n 个节点
    slow?.next = slow?.next?.next
    // 6. 返回新的头节点（dummy 的下一个节点）
    return dummy.next
}
