//
//  剑指offer31题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/1/8.
//

import Foundation

/**
 * 题目：输入一个整型数组，数组里有正数也有负数，数组中国一个活连续多个整数组成一个子数组，求所有子数组的和的最大值。要求时间复杂度为O(n)
 *
 *  例如：输入的数组为[1 、-2、3、10、-4、7、2、-5],和最大子数组为[3、10、-4、7、2] 因此输出和为18
 *
 *
 */


func testJianzhiOffer31() -> Void {
    let list1 = [1,-2,3,10,-4,7,2,-5]
    let list2 = [-1,-2,-3,-10,-4,-7,-2,-5]
    let list3 = [1,-2,3,10,-4,7,2,-5,20,2]
    let reusult1 = findGreaterSumOfSubArray(input: list1, length: list1.count)
    print("普通算法最大数组和为=\(reusult1)")
    
    let reuslt2 = findGreaterSumOfSubArray2(input: list2, length: list1.count)
    print("动态规划之递归最大数组和为=\(reuslt2)")
    
    let reuslt3 = findGreaterSumOfSubArray3(input: list3, length: list3.count)
    print("动态规划之循环最大数组和为=\(reuslt3)")
}
//方法一：
fileprivate func findGreaterSumOfSubArray(input: [Int]?, length: Int) -> Int{
    guard let list = input else {
        return 0
    }
    if length <= 0 {
        return 0
    }
    var maxSum = list[0]
    var result = list[0]
    for i in 0..<length {
        if maxSum <= 0 {
            //放弃前面的值，取当前的值作为和
            maxSum = list[i]
        }else {
            //否则，需要将所有的加起来
            maxSum += list[i]
        }
        //每次保存一次最大值。记录到result中
        if maxSum > result {
            result = maxSum
        }
    }
    return result
}

//方法二采用递归，动态规划思想，
fileprivate func findGreaterSumOfSubArray2(input: [Int]?, length:Int) ->Int{
    guard let list = input else {
        return 0
    }
    var sum = list[0]
    _ = maxArray(input: list, end: list.count-1,maxSum: &sum)
    return sum
}

fileprivate func maxArray(input:[Int],end:Int,maxSum: inout Int) ->Int{
    if end == 0 || maxArray(input: input, end: end - 1,maxSum: &maxSum) <= 0 {
        if input[end] > maxSum {
            maxSum = input[end]
        }
        return input[end]
    }else{
        if maxArray(input: input, end: end - 1,maxSum: &maxSum) + input[end] > maxSum {
            maxSum = maxArray(input: input, end: end - 1,maxSum: &maxSum) + input[end]
        }
        return maxArray(input: input, end: end - 1,maxSum: &maxSum) + input[end]
    }
}

//方法三：不采用递归，采循环的方式，思想还是动态规划的思想
fileprivate func findGreaterSumOfSubArray3(input: [Int]?, length: Int) -> Int{
    guard let list = input else {
        return 0
    }
    var maxSum : [Int] = Array(repeating: 0, count: length)
    maxSum[0] = list[0]
    var result = maxSum[0]
    for i in 1..<length {
        if i == 0 || maxSum[i-1] <= 0 {
            maxSum[i] = list[i]
        }else{
            maxSum[i] = maxSum[i-1] + list[i]
        }
        if result < maxSum[i] {
            result = maxSum[i]
        }
    }
    return result
}
