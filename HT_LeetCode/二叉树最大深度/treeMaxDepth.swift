//
//  treeMaxDepth.swift
//  HT_LeetCode
//
//  Created by chenzhuqing on 2020/11/29.
//

import Foundation

func testTreeMaxDepth() -> Void {

    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    let node6 = TreeNode(6)
    let node7 = TreeNode(7)
    let node8 = TreeNode(8)
    let node9 = TreeNode(9)
    let node10 = TreeNode(10)
    let node11 = TreeNode(11)
    let node12 = TreeNode(12)

    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    node3.left = node6
    node3.right = node7
    node4.left = node8
    node4.right = node9
    node5.left = node10
    node5.right = node11
    node6.left = node12

    print("最大的深度为\(maxDepth(root: node1))")


}

/**
 * 求最大的深度
 */

func maxDepth(root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    return max(maxDepth(root: root.left), maxDepth(root: root.right)) + 1
}

/**
 * 判断是否是二叉排序树
 */

func isValidBST(root: TreeNode?) -> Bool {
    return _helper(node: root, nil, nil)
}

fileprivate func _helper(node: TreeNode?,_ min:Int?, _ max : Int?)->Bool {
    guard let node = node else {
        return true
    }
    if let min = min,node.val <= min {
        return false
    }

    if let max = max,node.val >= max {
        return false
    }
    return _helper(node: node.left, min, node.val) && _helper(node: node.right, node.val, max)
}

