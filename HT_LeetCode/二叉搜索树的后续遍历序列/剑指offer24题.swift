//
//  剑指offer24题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/31.
//

import Foundation

/**
 * 题目： 输入一个整数数组，判断该数组是不是某个二叉搜索树的后序遍历的结果，如果是则返回true，否则返回false，假设输入的数组的任意两个数字都互不相同
 *
 *例如： 输入[5，7，6，9，11，10，8] 则返回true
 *
 *               8
 *             /    \
 *            6      10
 *           / \    /  \
 *          5   7   9   11
 *
 * 假如输入的是【7 ,4,6 ,5】
 *
 * 分析：由于是后序排序数组，因此最后一个数值就是二叉搜索树的根节点，然后更节点会将所有的数值分成两个部分，左节点和右节点 ，所有比更节点小的数值都在左节点，所有比根节点大的都在右节点。
 *
 * 例如： 最后一个数值是 8 ，然后，8将数组分成两部分【5，7，6】【9，11，10】
 * 第一个部分就是左节点，第二部分就是有节点
 *
 *然后继续判断左节点数组是不是二叉搜索树， 节点6 将数组分成【5】 【7】 满足条件。
 *
 *然后判断右节点数组是不是二叉搜索树，节点10将数组分成【9】【11】 满足条件，
 *
 *返回true
 *
 *
*/

func testJianzhiOffer24() -> Void {
//    let list = [5,7,6,4,9,11,10,8]]
    let list = [1,9,11,10,8]
    let boolValue = verifySquenceOfBST(sequence: list, length: list.count)
    if boolValue == true {
        print("这是二叉排序树")
    }else{
        print("不是二叉排序树")
    }
}

fileprivate func verifySquenceOfBST(sequence: [Int]?, length: Int) ->Bool{
    guard let list = sequence else {
        return false
    }
    if length <= 0 {
        return false
    }
    let root = list[length-1]
        
    var start = 0
    
    for (index,value) in list.enumerated() {
        start = index
        if value > root {
            break
        }
    }
    
    for j in start..<length {
        if list[j] < root {
            return false
        }
    }
    var left = true
    
    if start > 0 {
        let leftlist = Array(list[0..<start])
        left = verifySquenceOfBST(sequence: leftlist, length: leftlist.count)
    }
    var right = true
    if start < length-1{
        let rightList = Array(list[start..<length-1])
        right = verifySquenceOfBST(sequence: rightList , length: rightList.count)
    }
    return left && right
}



 
