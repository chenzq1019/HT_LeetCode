//
//  RebuildBinaryTree.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/2.
//

import Foundation
/**
 *  题目：输入某二叉树的前序遍历和中序遍历的结构，请重建出该二叉树，
 *  假设输入的前序遍历和中序遍历的结果都不是包含重复的数字，例如：输入前序遍历：【1，2，4，7，3，5，6，8】
 *  和中序遍历：[4,7,2,1,5,3,8,6]
 */

func testBuildBinaryTree() -> Void {
    //测试案例1，
    let proList : [Int] = [1,2,4,7,3,5,6,8]
    let midList : [Int] = [4,7,2,1,5,3,8,6]
    
    
    var footNodel: TreeNode?
    buildBinaryTree(node: &footNodel, proList: proList, midList: midList)
    
    print("构建成功");
    testDemo01()
}

func testDemo01() -> Void {
    let proList : [Int] = [1,2,3,4,5,6,7,8]
    let midList : [Int] = [8,7,6,5,4,3,2,1]
    
    
    var footNodel: TreeNode?
    buildBinaryTree(node: &footNodel, proList: proList, midList: midList)
    
    print("构建成功");
}


fileprivate func buildBinaryTree(node: inout TreeNode?, proList:[Int]?,midList: [Int]?) -> Void{
    
    if let proList = proList, let midList = midList  {
        let nodeValue = proList.first!
        let index = midList.firstIndex(of: nodeValue)
        var midleftArray : [Int]?
        var midrightArry : [Int]?
        var proLeftArray : [Int]?
        var proRightArray: [Int]?
        if let index = index  {
            midleftArray = Array(midList[0..<index])
            if let left = midleftArray, left.count > 0 {
                proLeftArray = Array(proList[1...left.count])
            }
            midrightArry = Array(midList[(index+1)..<midList.count])
            if let righ = midrightArry ,righ.count > 0{
                let start = proList.count - righ.count
                
                proRightArray = Array(proList[start..<proList.count])
            }
        }
        let newNode = TreeNode(nodeValue)
        buildBinaryTree(node: &newNode.left, proList: proLeftArray, midList: midleftArray)
        buildBinaryTree(node: &newNode.right, proList: proRightArray, midList: midrightArry)
        node = newNode
    }
    
   
  
}
