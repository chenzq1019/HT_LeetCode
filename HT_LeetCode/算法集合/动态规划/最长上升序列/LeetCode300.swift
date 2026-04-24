//
//  LeetCode600.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2026/4/24.
//

import Foundation


/*
 题目： 最长上升子序列
 
 描述：
 
 给定一个无序的整数数组，找到其中最长上升子序列的长度。
 
 
 示例：
 
 输入: [10,9,2,5,3,7,101,18]
 输出: 4
 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 
 
 */


func testLeeCode300() {
    
    let array = [10,9,2,5,3,7,101,18]
    let count = lengthOfList(nums: array)
    print(count)
    let subArray = longestIncreasingSubsequence(nums: array)
    print(subArray)
}


private func lengthOfList(nums: [Int]) -> Int {
    if nums.count < 1 {
        return 0
    }
    var dp: [Int] = Array(repeatElement(0, count: nums.count))
    var result : Int = 1
    for i in 0..<nums.count {
        dp[i] = 1
        for j in 0..<i {
            if nums[j] < nums[i] {
                dp[i] = max(a: dp[j] + 1, b: dp[i])
            }
        }
        result = max(a: result, b: dp[i])
    }
    return result
}

func max(a: Int, b: Int) -> Int {
    if a > b {
        return a
    }
    return b
}


private func longestIncreasingSubsequence(nums: [Int]) -> [Int] {
    // 空数组直接返回空
    if nums.isEmpty {
        return []
    }
    
    let n = nums.count
    // dp[i] = 以 nums[i] 结尾的最长递增子序列长度
    var dp = Array(repeating: 1, count: n)
    // prev[i] = 记录 nums[i] 前一个元素的索引，用于回溯路径
    var prev = Array(repeating: -1, count: n)
    // 记录最长子序列的最后一个元素索引
    var maxLength = 1
    var lastIndex = 0
    
    // 动态规划遍历
    for i in 0..<n {
        for j in 0..<i {
            if nums[j] < nums[i], dp[j] + 1 > dp[i] {
                dp[i] = dp[j] + 1
                prev[i] = j // 记录前驱节点
            }
        }
        
        // 更新最长长度和最后一个索引
        if dp[i] > maxLength {
            maxLength = dp[i]
            lastIndex = i
        }
    }
    
    // 从 lastIndex 反向回溯，得到最长递增子序列
    var lis: [Int] = []
    var current = lastIndex
    while current != -1 {
        lis.append(nums[current])
        current = prev[current]
    }
    
    // 反向回来的顺序是反的，需要反转
    return lis.reversed()
}
