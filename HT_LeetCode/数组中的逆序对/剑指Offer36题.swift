//
//  剑指Offer36题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/6/3.
//

import Foundation


/**
 * 题目： 在数组中的两个数字如果前面一个数字大于后面的数字，则这个两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。
 * 实例：输入数组[7,5,6,4]中一个存在5个逆序数分别是：[7,5],[7,6],[7,4],[5,4],[6.4]
 *
 *分析：
 * 方法一、最直观的方法就是遍历数组，取数组第一个数字，跟后面的数字作比较，如果大于后面的数字则是一对逆序数，
 * 然后依次遍历找出所有的的逆序数，这种方法的复杂度是o(n^2)
 *
 *方法二、通过归并排序的方法。复杂度为（nlog(n)）
 *
 **/

func testJianzhiOffer36() -> Void {
    
    let list = [7,5,6,4]
    findReverseArray_solution1(list)
}

fileprivate func findReverseArray_solution1 (_ list:[Int]) -> Void{
    for i in 0..<list.count-1 {
        for j in (i+1)..<list.count {
            if list[i] > list[j] {
                print("\(list[i])  \(list[j])\n");
            }
        }
    }
}
