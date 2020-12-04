//
//  rotateArraysMinNumber.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/4.
//

import Foundation

/**
 * 题目：旋转数组的最小数字，吧一个数组最开始的若干元素搬到数组的末尾，我们称之为数组的旋转，输入一个递增排序的数组的一个旋转，输出
 * 旋转转数组的一个最小元素，
 * 例如：【3，4，5，1，2】为【1，2，3，4，5】 的一个旋转，该数组的最小值为1.
 * 分析：题目要求找出最小的数组，其实我们最直观的方法就是可以遍历这个数组就可以得到我们要的最小值。
 * 但是，这样的做法虽然可以得到结果却不是我们想要的算法。
 * 题目中给了这个旋转数组其实是有序的。也就是要求我们通过二分查找的方法来获取这个最小值。
 * 由于是旋转过后的，因此我们需要知道哪些部分是有序
 * 比如： 我们可以在数组中间取一个值，如果这个值的右边都比其小，说明最小值在右边。否则在左边
 */

func testRotatoArray() -> Void {
    let rotatoArray = [7,9,10,34,40,50,51,54]
    print(findRotatArrayMinNumber(rotatos: rotatoArray, start: 0, end: rotatoArray.count-1))
}


fileprivate func findRotatArrayMinNumber(rotatos:[Int], start:Int, end: Int) -> Int {
    
    var start = start
    var end = end
    //如果第一个就小于最后一个，说明没有旋转直接返回第一个
    if rotatos[start] < rotatos[end] {
        return rotatos[start]
    }
    
    //如果剩下两个，则最后一个是最小的。因为旋转的原因
    if end - start == 1 {
        return rotatos[end]
    }
    //如果指向只有一个，则直接返回
    if start == end {
        return rotatos[start]
    }
    
    //计算中心点
    let midIndex = (end + start) / 2
    //计算中心数值
    let midVaule  = rotatos[midIndex]
    //如果起始数值 小于中心点，则说明左边是有序的，将起始点移动到中心点上。
    if rotatos[start] < midVaule {
        start = midIndex
    }
    //如果最后一个值，大于中心点值，则说明右边是有序的。将结束点移动中心点上。
    if rotatos[end] > midVaule {
        end = midIndex
    }
    //继续计算剩下的
    return findRotatArrayMinNumber(rotatos: rotatos, start: start, end: end)
}


