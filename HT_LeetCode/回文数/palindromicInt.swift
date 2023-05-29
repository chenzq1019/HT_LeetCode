//
//  palindromicInt.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/26.
//

import Foundation


/**
 * 题目：判断给定的整数是否是回文数
 *例如：12 不是
 *121 是
 *-121不是
 *
 *分析： 整数是回文数，我们可以通过计算来判断
 *既然是回文数，那么我们可以从个位开始计算这个数是否等于原来的数。
 *1、首先对原来的数对10取余数。
 *2、然后取整。
 *3、重复上述操作
 *4、直到为0
 *
 **/
func testHuiwenShu() -> Void {
    if judgeHuiwenshu(target: 0) {
        print("是回文数")
    }
}

func judgeHuiwenshu(target: Int) -> Bool {
    
    if target < 0 {
        return false
    }
    if target < 10 && target >= 0 {
        return true
    }
    var older = target
    var sum = 0
    while older > 0 {
        let temp = older % 10
        sum = sum * 10 + temp
        older = older / 10
    }
    if target ==  sum {
        return true
    }
    return false
}
