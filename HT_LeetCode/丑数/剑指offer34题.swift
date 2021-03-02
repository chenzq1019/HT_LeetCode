//
//  剑指offer34题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/3/2.
//

import Foundation

/**
 *  题目：我们把只包含因子2，3，5的数称为丑数（Ugly Number），求按照从小到大的顺序的第1500个丑数，例如6，8 都是丑数，但14不是，因为他包含因子7，习惯上我们把1当做第一个丑数。
 *
 *
 *  分析：1、我们可以逐个判断每个整数是不是丑数，这个是最简单直观的解法，但是效率低下。
 *
 *  判断是否是丑数，我们只要判断该数是否可以被2，3，5整除就可以了。
 *
 *   2、方法二，穿件数组保存已经找到的丑数，用空间换时间的解法
 *
 *
 */

func testJianzhiOffer34() -> Void {
    print("======方法一=====")
    let founUgly = GetUglyNumber_Solution1(index: 150)
    print(founUgly)
    print("=======方法二========")
    let found = GetUglyNumber_Solution2(index: 150)
    print(found)
}

fileprivate func IsUgly(number: Int) ->Bool {
    var target : Int = number
    while target % 2 == 0 {
        target = target / 2
    }
    while target % 3 == 0 {
        target = target / 3
    }
    while target % 5 == 0 {
        target = target / 5
    }
    return (target == 1) ? true : false
}

fileprivate func GetUglyNumber_Solution1(index: Int) ->[Int]?{
    if index <= 0 {
        return nil
    }
    var uglyFound = 0
    var number = 0
    var uglyNumberArray : [Int] = [Int]()
    while uglyFound < index  {
        number += 1
        if IsUgly(number: number) {
            uglyFound += 1
            uglyNumberArray.append(number)
        }
    }
    return uglyNumberArray
}

fileprivate func GetUglyNumber_Solution2(index: Int) ->[Int]?{
    if index <= 0 {
        return nil
    }
    var pUglyNumbers : [Int] = Array(repeatElement(0, count: index))
    pUglyNumbers[0] = 1
    var nextUglyIndex = 1
    var pMutiplay2 = 0
    var pMutiplay3 = 0
    var pMutiplay5 = 0
    while nextUglyIndex < index {
        let min = Min(number1: pUglyNumbers[pMutiplay2] * 2, number2: pUglyNumbers[pMutiplay3] * 3, number3: pUglyNumbers[pMutiplay5] * 5)
        pUglyNumbers[nextUglyIndex] = min
        while pUglyNumbers[pMutiplay2] * 2 <= pUglyNumbers[nextUglyIndex] {
            pMutiplay2 += 1
        }
        while pUglyNumbers[pMutiplay3] * 3 <= pUglyNumbers[nextUglyIndex] {
            pMutiplay3 += 1
        }
        while pUglyNumbers[pMutiplay5] * 5 <= pUglyNumbers[nextUglyIndex] {
            pMutiplay5 += 1
        }
        nextUglyIndex += 1
    }
    
    let ugly = pUglyNumbers[nextUglyIndex - 1]
    return pUglyNumbers
}

fileprivate func Min(number1: Int, number2: Int,number3:Int) -> Int{
    var min = (number1 < number2) ? number1 : number2
    min = (min < number3) ? min : number3
    return min
}
