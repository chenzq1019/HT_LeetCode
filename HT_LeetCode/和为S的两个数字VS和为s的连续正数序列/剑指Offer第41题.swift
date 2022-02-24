//
//  剑指Offer第41题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/12/14.
//

import Foundation


/**
 * 题目： 输入一个递增的数组和一个数字是， 在数组中查找两个数，使得他们的和正好是s，如果有多对数字的和等于s，输出任意一对即可
 */

func testJianzhiOffer41(){
    let numbers = [1,2,4,7,11,15]
    let target = 16
    let result = findSumEqual(to: target, array: numbers)
    if let findArray = result {
        print(findArray)
    }else{
        print("没有符合条件的数字")
    }
    
    let sequence = findSequenceNumer(sum: 15)
    if let arr = sequence {
        print(arr)
    }else{
        print("没有找到")
    }
   
}

func findSumEqual(to:Int,array:[Int]?) -> [Int]?{
    guard let sourceArray = array else {
        return nil
    }
    var result : [Int] = [Int]()
    var start = 0
    var end = sourceArray.count - 1
    while (start < end){
        if (sourceArray[start] + sourceArray[end]) > to {
            end -= 1
        }else if (sourceArray[start] + sourceArray[end]) < to {
            start += 1
        }else{
            result.append(sourceArray[start])
            result.append(sourceArray[end])
            return result
        }
    }
    return nil
}

/**
 * 题目：输入一个正数s，打印出所有和为s的连续正数序列（至少好友两个数），例如：
 * 输入15， 由于 1+2+3+4+5=4+5+6=7+8=15， 所以结果打印出3个连续序列1~5，4~6，7~8
 *
 */

func findSequenceNumer(sum:Int) ->[[Int]]?{
    var small = 1
    var big = 2
    if sum < big {
        return nil
    }
    var result : [[Int]] = [[Int]]()
    while big < sum {
        var total = 0
        var tempArray = [Int]()
        for number in small...big {
            total += number
            tempArray.append(number)
        }
        if total < sum {
            big += 1
        }else if total > sum {
            small += 1
        }else{
            big += 1
            result.append(tempArray)
        }
    }
    return result.count > 0 ? result: nil
}
