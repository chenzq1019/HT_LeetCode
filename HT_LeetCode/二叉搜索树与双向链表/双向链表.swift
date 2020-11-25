//
//  双向链表.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/25.
//

import Foundation
/*
 题目： 给定一个二叉搜索树，将其转为一个从小到大排序的双向链表
 分析： 首先我们我们知道这是一个二叉排序树，因此我们要得到一个排序的顺序，就要对二叉树进行中序遍历。
 然后将遍历的结果顺序，再转化成一个双向链表结构，就可以了。
 
 */

func testDoubleLinke() -> Void {
    //构建测试用的搜索二叉树
    /*
                 10
                /  \
               6    14
              / \  / \
             4  8 12  16
     */
    let node1 = TreeNode(10)
    let node2 = TreeNode(6)
    let node3 = TreeNode(14)
    let node4 = TreeNode(4)
    let node5 = TreeNode(8)
    let node6 = TreeNode(12)
    let node7 = TreeNode(16)
    
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    node3.left = node6
    node3.right = node7
    
    transToDoubleLink(node: node1)
        
}

//开始转化
func transToDoubleLink(node: TreeNode?) -> Void {
    var list : [TreeNode] = []
    inorderTraversa(node: node, list: &list)
    for i in 0..<list.count-1 {
        let n1 = list[i]
        let n2 = list[i+1]
        n1.right = n2
        n2.left = n1
    }
    print(list)
}
//二叉树中序遍历
func inorderTraversa(node: TreeNode?,list: inout [TreeNode]) -> Void {
    guard let n = node else {
        return
    }
    inorderTraversa(node: n.left, list: &list)
    list.append(n)
    inorderTraversa(node: n.right, list: &list)
}
