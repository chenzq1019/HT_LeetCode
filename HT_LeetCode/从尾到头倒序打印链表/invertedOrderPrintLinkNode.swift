//
//  invertedOrderPrintLinkNode.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/2.
//

import Foundation

/**
 *题目： 给定一个单向链表，设计一个方法从链表尾部到头部打印各个节点的值。
 *
 * 分析： 我们知道一个单向链表我们可以从头遍历的尾部。如何倒序打印呢，
 * 1、第一个直观的想法是，我们可以遍历一遍这个链表，将所有节点保存到数组中，然后再从末尾遍历数值上的
 * 节点就可以实现。可是这样虽然可以实现，但是我们需要多开辟了一个数组的空间，而且我们在不知道链表长度的情况下
 * 无法定义个足够大空间的数组。再一个就是及时有足够大空间的数组，我们遍历两次才能打印结构，效率非常低下。
 *
 *2、因此我们可以通过递归的思路来实现。我们知道递归是一层一层嵌套，知道递归结束条件满足，然后一层一层返回。
 *我们就可以利用递归返回的特性，进行打印不就是倒序了吗，
 */

func testInvertOrderPrintLink() -> Void {
    
    let arry : [Int] = [ 1,2,3,4,5,6,7,8,9];
    var node : ListNode?
    for i in 0..<arry.count {
         buildLiskNode(node: &node, val: arry[i])
    }
    print("")
    printLinkNode(node: node)
}

fileprivate func buildLiskNode(node:inout ListNode?, val: Int) ->Void{
    if let node = node {
        let newNode = ListNode(val)
        var head = node
        //循环找到最后一个节点，
        while head.next != nil {
            head = head.next!
        }
        head.next = newNode
        
    }else {
        let newNode = ListNode(val)
        node = newNode
    }
}

fileprivate func printLinkNode(node: ListNode?) -> Void {
    guard let node = node else {
        return
    }
    printLinkNode(node: node.next)
    print(node.val)
}
