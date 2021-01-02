//
//  剑指Offer第12题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/16.
//

import Foundation
/**
 *题目：输入数字n，按顺序打印出从1到最大n位十进制数。比如输入3，则打印1、2、3、一直到最大的3位数即999
 *
 *分析：主要需要注意如果输入一个很大的数，可能会超出double 的限制。因此不能简单用整型循环打印数值。
 *通常考虑用字符串模拟数字
 *
 */

func testPrintNumber() -> Void {
    var arraylist : [Int] = Array(repeating: -1, count: 3)
    printNumber("3", 0, &arraylist)
}

fileprivate func printNumber(_ number: String, _ index: Int,_ list:inout [Int]) -> Void{
    let num = Int(number)
    guard let n = num else {
        return
    }
    if  index >= n {
        print(list)
        return;
    }
    for i in 0...9 {
        list[index] = i
        printNumber(number, index + 1, &list)
    }
}
