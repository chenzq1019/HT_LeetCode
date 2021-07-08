//
//  剑指Offer第39题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/7/8.
//



import Foundation


/**
 * 题目一： 输入一棵二叉树的根节点，求该树的深度，从根节点到叶节点依次经过的节点形成树的一条路径，最长路径的长度为树的深度。
 *
 **/


func testJianzhiOffer39() -> Void {
    
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(5)
    let node6 = TreeNode(6)
    let node7 = TreeNode(7)
    
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    node5.left = node7
    node3.right = node6
    
    let level = treeDepth(root: node1)
    
    print(level)
    
}


private func treeDepth( root: TreeNode?) -> Int{
    if  let tempRoot = root {
        let left = treeDepth(root: tempRoot.left)
        let right = treeDepth(root: tempRoot.right)
        return (left > right) ? (left + 1) : (right + 1)
    }else {
        return 0;
    }
}

/**
 * 题目二： 输入一棵二叉树的根节点，判断该数是不是平衡二叉树。例如，如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树，例如。下图中的二叉树就是一棵平衡二叉树。
 *
 *       1
 *      /  \
 *     2    3
 *    / \     \
 *   4   5     6
 *       /
 *      7
 **/

//方法一：效率比较低，因为很多节点遍历了多次。
private func isBalanceTree(root: TreeNode?) ->Bool{
    if(root == nil){
        return true
    }
    //判断当前节点是不是层级相差1
    let left = treeDepth(root: root?.left)
    let right = treeDepth(root: root?.right)
    
    let diff = left - right
    if diff > 1 || diff < -1 {
        return false
    }
    //继续左右节点
    return isBalanceTree(root: root?.left) && isBalanceTree(root: root?.right)
    
}

//方法二

private func isBalanceTree(root: TreeNode?, pDepth: inout Int) -> Bool{
    if root == nil {
        pDepth = 0
        return true
    }
    var left : Int = 0
    var right : Int = 0
    if isBalanceTree(root: root?.left, pDepth: &left) && isBalanceTree(root: root?.right, pDepth: &right) {
        
        let differ = left - right
        if differ <= 1 && differ >= -1 {
            pDepth = 1 + ( left > right ? left : right)
            return true
        }
    }
    return false
}
