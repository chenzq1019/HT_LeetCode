//
//  LeeCode350.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2022/7/19.
//

import Foundation

/**
 题目： 两个数组的交集
 给定两个数组，编写一个函数来计算它们的交集
 
 示例1：
 输入：nums1= [1,2,2,1] ,nums2= [2,2]
 
 输出：[2, 2]
 
 示例2：
 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出：[4,9]
 
 说明：
 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
 不考虑输出结果的顺序。
 
 
 */

func testLeeCode350() {
    let result = intersect(nums1: [1,2,2,1], nums2: [2,2])
    print(result)
    
    let result2 = intersect(nums1: [4,9,5], nums2:  [9,4,9,8,4])
    print(result2)
    
    let result3 =  intersectSort(nums1: [13,1,4,4,3,2], nums2: [10,3,9,2,1])
    print(result3)
}

fileprivate func intersect(nums1:[Int], nums2:[Int]) ->[Int]? {
    var map = [Int:Int]()
//    map[9] = 0
    for num in nums1 {
        if let n = map[num]  {
            map[num] = n + 1
        }else{
            map[num] = 1
        }
    }
    var resultArray: [Int]? = [Int]()
    for num in nums2{
        if let n = map[num], n > 0{
            map[num] = n - 1
            resultArray?.append(num)
        }
    }
    
    return resultArray
}

/**
 进阶：可以先对数组进行排序，然后通过两个指针移动来判断是否有相同的元素。
 */

fileprivate func intersectSort(nums1:[Int], nums2:[Int]) ->[Int]?{
    let sortNums1 = nums1.sorted { first, second in
        first < second
    }
    let sortNums2 = nums2.sorted { first, second in
        first < second
    }
    var i = 0
    var j = 0
    var resultArray : [Int]? = [Int]()
    while i < sortNums1.count && j < sortNums2.count {
        let first = sortNums1[i]
        let second = sortNums2[j]
        if first == second {
            resultArray?.append(first)
            i = i + 1
            j = j + 1
        }else if (first < second) {
            i = i + 1
        }else {
            j = j + 1
        }
    }
    return resultArray
}
