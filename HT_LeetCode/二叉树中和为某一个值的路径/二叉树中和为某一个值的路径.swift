//
//  二叉树中和为某一个值的路径.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/25.
//

import Foundation
/**
 题目： 二叉树中和为某一个值的路径
 
 题目分析：
 要获取二叉树中路径之后为某值，我们就需要遍历所有路径，然后判断是否为指定某个值，如果是我们就保存到数组中。
 利用二叉树的前序遍历的方法就可以
 **/

func testSumEqualTo() -> Void {
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
    
    var list : [TreeNode] = []
    inorderTreeToSum(node: node1, target: 10, current: 0, paths: &list)
    
}

func inorderTreeToSum(node: TreeNode?,target: Int ,current: Int, paths: inout [TreeNode]) -> Void {
    guard let n = node else {
        return
    }
    //保存当前节点
    paths.append(n)
    //计算当前节点的和
    let sum = current + n.val
    //判断是否满足条件，如果满足条件打印出路劲
    if sum == target {
        print("************")
        for p in paths {
            print("\(p.val)->")
        }
        print("===========")
    }
    //遍历左子树
    inorderTreeToSum(node: n.left, target: target, current: sum, paths: &paths)
    //遍历右子树
    inorderTreeToSum(node: n.right, target: target, current: sum, paths: &paths)
    //回溯到上一个节点，需要把最后一个节点删除。
    if paths.count > 0 {
        paths.removeLast()
    }
   
}
