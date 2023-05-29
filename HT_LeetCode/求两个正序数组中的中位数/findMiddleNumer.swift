//
//  findMiddleNumer.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/27.
//

import Foundation

/**
 *题目描述：给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
 
 解法一：有序数组合并

 将2个数组按顺序合并到一个大数组里面，2个数组都只会遍历一次。然后在大数组中获取中位数。
 
 
 
 */

func testFindMidleNumber() -> Void {
    let array1 = [1,3,4,9]
    let array2 = [1,2,3,4,5,6,7,8,9,10]
    let reuslt = findMedianSortedArrays(array1, array2)
    print(reuslt)
}

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var array = [Int]()
    let lenth1 = nums1.count
    let lenth2 = nums2.count
    var i = 0
    var j = 0
    while i < lenth1 && j < lenth2 {
        if nums1[i] < nums2[j] {
            array.append(nums1[i])
            i += 1
        }else {
            array.append(nums2[j])
            j += 1
        }
    }

    for index in i..<lenth1 {
        array.append(nums1[index])
    }
    for index in j..<lenth2 {
        array.append(nums2[index])
    }
    
    let len = array.count
    if len <= 0 {
        return 0.0
    }
    var result = 0.0
    if len % 2 == 0 {
        let mid = len / 2
        result = Double((array[mid] + array[mid-1])) / 2.0
    }else{
        let mid = len / 2
        //Int(floor(Double(len / 2)))
        result = Double(array[mid])
    }
    return result
}
