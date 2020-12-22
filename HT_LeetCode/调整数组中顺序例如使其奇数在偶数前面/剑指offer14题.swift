//
//  剑指offer14题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/22.
//

import Foundation

/**
 * 题目：输入一个整数数组，实现一个函数来调整该数组中的数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分
 * 分析：如果不考虑时间复杂度的话，最简单的思路是从头扫描这个数组，每个喷到一个偶数，就放到数组的最后一位。
 * 这样的时间复杂度是O(n^2)。这样面试官是不会满意的。
 * 改进的方法是通过两个指针，一个指针指向数组的起始位置，一个指针指向数组的结束位置，首先判断这两个指针指向的数值是奇数还是偶数，如果都是奇数，则第一个指针向后移动一位，继续比较直到第一指针指向一个偶数，
 *
 * 这时，交换第一个和第二指针指向的数值。也就是将偶数值放到第二个指针的位置。然后向前移动第二个指针。
 *
 * 继续比较。如果第二个指针是偶数则，继续移动。
 *
 * 最后一直到第一个指针跟第二指针重合结束。
 *
 * 进阶：如果题目要求所有负数在前面，所有正数在后面呢，如果题目换成所有被3整除的数在前面呢。
 * 这就需要我们将设计一个通用的方法，将排序条件使用闭包形式决定。
 */


func testJianzhiOffer14() -> Void {
    var list : [Int] = [2,4,6,8,10,3,5,7,9,11]
    var list2 : [Int] = [2,-3,1,6,-7,4,5,-3,8,-9]
//    reorderList(list: &list)
    reorderListNormal(list: &list) { (a) -> Bool in
        return a % 2 == 0
    }
    print(list)
    reorderListNormal(list: &list2) { (a) -> Bool in
//      return a % 2 == 0
        return a >= 0
    }
    print(list2)
}

fileprivate func reorderList( list :inout [Int] ) -> Void {
    //如果数组为空直接返回
    if list.count < 0 {
        return
    }
    //定义两个指向数组的指针，我们可以使用下标代替指针
    var start : Int = 0
    var end : Int = list.count - 1
    //只要两个指针没有重合就继续
    while start < end {
        let firstValue = list[start]
        let lastValue = list[end]
        //
        if lastValue % 2 == 0 {
            end -= 1
        }else{
            if firstValue % 2 == 0 {
                swapListValue(&list, start, end)
                end -= 1
            }else{
                start += 1
            }
        }
    }
}


fileprivate func reorderListNormal( list :inout [Int] ,sort: (_ b: Int)->Bool) -> Void {
    //如果数组为空直接返回
    if list.count < 0 {
        return
    }
    //定义两个指向数组的指针，我们可以使用下标代替指针
    var start : Int = 0
    var end : Int = list.count - 1
    //只要两个指针没有重合就继续
    while start < end {
        let firstValue = list[start]
        let lastValue = list[end]
        //
        if sort(lastValue) {
            end -= 1
        }else{
            if sort(firstValue) {
                swapListValue(&list, start, end)
                end -= 1
            }else{
                start += 1
            }
        }
    }
}
