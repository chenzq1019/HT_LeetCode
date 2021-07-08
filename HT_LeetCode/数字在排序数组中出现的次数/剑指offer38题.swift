//
//  剑指offer38题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/7/8.
//


import UIKit


/**
 * 题目：统计一个数字在排序中出现的次数，例如输入排序树组[1,2,3,3,3    3,4,5]和数字3，由于3在这个数组中出现了4次，因此输出4
 *
 *
 *  分析： 使用二分查找法，找到相同数字的起始位置，就能算出数组中相同数字的个数。
 **/


func testJianzhiOffer38() -> Void {
    let list = [1,2,3,3,3,3,3,4,5]
    let lenth = list.count
    let k = 3
    let number = findNumberOfK(list: list, length: lenth, k: k)
    print(number)
}


private func findNumberOfK(list : [Int], length: Int, k:Int) -> Int{
    var number = 0
    let first = getFirstOfK(list: list, length: length, k: k, start: 0, end: length - 1)
    let last = getLastOfK(list: list, length: length, k: k, start: 0, end: length - 1)
    if first > -1 && last > -1 {
        number = last - first + 1
    }
    return number
}

private func getFirstOfK(list: [Int], length: Int, k : Int, start:Int, end: Int) ->Int{
    
    if start > end {
        return -1
    }
    var endIndex :Int = end
    var startIndex:Int = start
    let middleIndex : Int = Int((start + end) / 2)
    let middleData: Int = list[middleIndex]
    
    if middleData == k {
        if middleIndex > 0 && list[middleIndex - 1] != k || middleIndex == 0{
            return middleIndex
        }else{
            endIndex = middleIndex - 1
        }
    }else if(middleData > k) {
        endIndex = middleIndex - 1
    }else{
        startIndex = middleIndex + 1
    }
    
    return getFirstOfK(list: list, length: length, k: k, start: startIndex, end: endIndex)
  
}

private func getLastOfK(list : [Int], length: Int,k:Int,start: Int,end: Int) -> Int{
    if start > end {
        return  -1
    }
    let middleIndex : Int = Int((start + end) / 2)
    let middleData : Int = list[middleIndex]
    var startIndex : Int = start
    var endIndex : Int = end
    if middleData == k {
        if middleIndex < length - 1 && list[middleIndex + 1] != k || middleIndex == length - 1  {
            return middleIndex
        }else {
            startIndex = middleIndex + 1
        }
    }else if (middleData < k){
        startIndex = middleIndex + 1
    }else {
        endIndex = middleIndex - 1
    }
    return getLastOfK(list: list, length: length, k: k, start: startIndex, end: endIndex)
}
