//
//  剑指offer19.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/22.
//

import Foundation
/**
 * 题目：请完成一个函数，输入一个二叉树，该函数输出她的镜像
 *
 *       8
 *      /  \
 *     6    10
 *    / \   / \
 *   5   7  9  11
 *
 *       8
 *      /  \
 *     10    6
 *    / \   / \
 *   11  9  7  5
 */


func testJianzhiOffer19() -> Void {
    let head = TreeNode(8)
    let node1 = TreeNode(6)
    let node2 = TreeNode(10)
    let node3 = TreeNode(5)
    let node4 = TreeNode(7)
    let node5 = TreeNode(9)
    let node6 =  TreeNode(11)
    head.left = node1
    head.right = node2
    node1.left = node3
    node1.right = node4
    node2.left = node5
    node2.right = node6
    mirrorRecursively(pNode: head)
    print("完成镜像")
    
}

fileprivate func mirrorRecursively(pNode: TreeNode?) -> Void{
    
    if (pNode == nil) || (pNode?.left == nil && pNode?.right == nil) {
        return
    }
    let tempNoe = pNode?.left
    pNode?.left = pNode?.right
    pNode?.right = tempNoe
    mirrorRecursively(pNode: pNode?.left)
    mirrorRecursively(pNode: pNode?.right)
}
