//
//  从上到小打印二叉树.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/26.
//

import Foundation
/**
 题目：给定一个二叉树，请按照从上到下的顺序逐个打印出每个节点的值。
 
 题目分析：既然需要打印出每个节点的值，我们首先想到的就是需要遍历这个二叉树。
 由于要求是从上到下，从左到右的顺序依次打印出每个节点。
 
 我们知道二叉树的遍历方法有： 前序遍历，中序遍历，后序遍历。
 无论哪种都不符合题目所要求的，按照每一层来进行输出打印。
 
 但是，二叉树如果我们从头结点开始最先可以得到一个头结点，以及两个左右子树的节点。因此，我们可以把节点从二叉树中取出来放入到一个队列中，根据队列的先进先出的原则我们将放入的节点依次从队列中取出，
 
 每次取出一个节点我们就将其左右子树放入到队列中，
 
 然后再出去节点。
 
 一直到队列中没有节点为止
 
 
 */

func testPrintBinaryTree() -> Void {
    //构建一个二叉树用于测试
    /*
                   1
                /     \
               2       3
              / \     /  \
             4   5   6    7
                    /
                   8
     */
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    let node6 = TreeNode(6)
    let node7 = TreeNode(7)
    let node8 = TreeNode(8)
    
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    node3.left = node6
    node3.right = node7
    node6.right = node8
    leveTraveBinaryTree(node: node1)
    
}

func leveTraveBinaryTree(node: TreeNode?) -> Void {
    var list : [TreeNode] = []
    guard let n = node else {
        return
    }
    list.append(n)
    while list.count > 0 {
        let tempNode = list.first
        //打印节点
        if let value = tempNode?.val {
            print(value)
        }
        if let left = tempNode?.left {
            list.append(left)
        }
        if let right = tempNode?.right {
            list.append(right)
        }
        list.removeFirst()
    }
    
}
