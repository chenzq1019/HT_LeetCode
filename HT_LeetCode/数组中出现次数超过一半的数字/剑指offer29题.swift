//
//  剑指offer29题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/1/6.
//

import Foundation

/**
 *  题目：数组中有一个数字出现的次数超过数组的长度的一半，请找出这个数字，
 *  例如：输入一个长度为9的数组[1,2,3,2,2,2,5,4,2]。由于数字2在数组中出现了5次，超过数组长度的一半因此输出2
 *
 *  分析： 看到这个题，第一反应是对数组排序后，取中间的数值就是超过一半的数值。但是这个算法效率太低了。
 *
 *  方法一： 利用快速排序的思路，任意取一个数值，将数组分成两部分，如果这个选中的数值的下标刚好是n/2,那么这个数字就是数组的中位数。如果下标大于n/2，那么中位数应该位于他的左边，我们可以接着在它的左边部分的数组中查找。如果下标小于n/2。那么中位数应该位于他的右边，我们可以接着在它的右边部分的数组中查找。
 *
 *  方法二：
 *  利用数组找那个数字出现次数超过一半，我们可以遍历一次数组，如果跟上次数字相同就+1，如果不同就-1，为0 的时候保存新的数子，最后一次如果次数
 */

func testJianzhiOffer29() -> Void {
//    let midleNumb = moreThanHalfNum(numbers: [1,2,3,2,2,2,5,4,2])
//    let midleNumb = moreThanHalfNum(numbers: [4,5,7,5,6,5,5,5,8,5])
    let midleNumb = moreHalfNumeMethodTwo(list: [1,2,3,2,4,2,5,2,2,2,6])
    if let findNume = midleNumb {
        print("找到超过一半的数为：\(findNume)")
    }else{
        print("没有找到")
    }
  
}


fileprivate func moreThanHalfNum(numbers: [Int]?) ->Int?{
    guard let list = numbers else {
        return nil
    }
    var listVar = list
    return findMidelInList(list: &listVar, start: 0, end: list.count-1)
}

fileprivate func findMidelInList(list:inout [Int], start: Int, end: Int) ->Int?{
    var s = start
    var e = end
    if s >= end {
        return nil
    }
    let key = list[s]
    let lenth = end - start + 1
    while s < e {
        //从数组最后开始，与key进行比较，如果满足条件，则继续j--,较前面一位的数
        while s < e && list[e] > key {
            e -= 1
        }
        swapListValue(&list, s, e)
        while s < e && list[s] <= key {
            s += 1
        }
        swapListValue(&list, s, e)
    }
    let index = s - start
    if index < lenth / 2 {
        return findMidelInList(list: &list, start: s + 1, end: end)
    }
    if index == lenth / 2 {
        return list[s]
    }
    if index > lenth / 2 {
        return findMidelInList(list: &list, start: start, end: s - 1)
    }
    
    return nil
}


fileprivate func moreHalfNumeMethodTwo(list: [Int]?) ->Int?{
    guard let listVar = list else {
        return nil
    }
    var count  = 1
    var findNum : Int? = listVar.first
    
    for i in 1..<listVar.count {

        if count == 0 {
            findNum = listVar[i]
            count = 1
        }else{
            if findNum != listVar[i] {
                count -= 1
            }else{
                count += 1
            }
        }
        
    }

    if count >= 1 {
        return findNum
    }
    return nil
}
