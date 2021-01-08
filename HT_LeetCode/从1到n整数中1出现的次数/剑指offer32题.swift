//
//  剑指offer32题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/1/8.
//

import Foundation

/**
 *  题目：输入一个整数n，求从1到n这n个整数的十进制表示中1出现的次数。
 *
 *  例如：输入12， 从1到12这些数中包含1的数字有1、10、11、12，一个出现5次。
 *
 *   分析： 如果不考虑时间复杂度 ，最简单最直观的方法就是从1到n进行循环，然后每次对10取余，判断是否为1，如果大于10则，在取整在取余判断是否为1.
 **/

func testJianzhiOffer32() -> Void {
    let num  = numberOfBetween1AndN(n: 55)
    print(num)
}

//方法一： 没有考虑时间复杂度的简单算法
fileprivate func numberOfBetween1AndN(n: Int) ->Int{
    if n <= 0 {
        print("请输入正确的数字")
        return 0
    }
    var totoal = 0
    for i in 1...n {
        var temp = i
        while temp > 0 {
            if temp % 10 == 1 {
                totoal += 1
            }
            temp = temp / 10
        }
    }
    return totoal
}

//方法二：

