//
//  剑指offer30题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/1/8.
//

import Foundation

/**
 * 题目： 输入n个整数，找出其中最小的k个数，例如输入4、5、1、6、2、7、3、8 这个8个数字，则最小的4个数字是1、2、3、4、
 *
 * 分析：这个题目最简单思路是对数组进行排序，然后输出最小的k个数字。当时这个算法的时间复杂度是nlogn，不符合面试官
 * 的要求。通常面试官会要求给出更优的算法。
 *
 * 方法一：我们可以从29题中出现次数超过一半的数字中得的启发，我们同样可以基于快速排序思路，找到基于数组的第k个数字来调整，使得比k个数字小的所有数字都在数组的左边，比k个数字大的数字都在数组的右边。
 *
 * 方法二：上面的方法是有限制的，首先我们是对数组的顺序进行了修改，如果在不修改顺序的情况下怎么办呢，如果数据量是海量数据呢。
 * 我们可以使用一个大小为k的容器来存储最小的k个数字，接下来我们每次从n个整数数中读取一个数，来跟容器进行比较。如果容器中未满则直接放入容器中，如果容器已满则需要跟容器中的数进行比较，如果比容器中最大值小，则需要将值插入到容器中，或者直接替换最大值。
 * 因此我们可以使用最大堆来保存k个数，
 *
 */

func testJianzhiOffer30() -> Void {
    let list = [4,5,1,6,2,7,3,8]
    let outPut = getlastNumber(input: list, n: 8, k: 5)
    if let find = outPut {
        print(find)
    }
}

fileprivate func getlastNumber(input: [Int]?, n: Int, k: Int) -> [Int]?{
    if input == nil || k > n || n < 0 || k < 0 {
        return nil
    }
    var list = input!
    var start = 0
    var end = n - 1
    var index = partition(input: &list , n: n, strart: start, end: end)
    while index != k - 1 {
        if index > k - 1 {
            end = index - 1
            index = partition(input: &list, n: n, strart: start, end: end)
        }else {
            start = index + 1
            index = partition(input: &list, n: n, strart: start, end: end)
        }
    }
    var ouput: [Int] = []
    for i in 0..<k {
        ouput.append(list[i])
    }
    return ouput
}

fileprivate func partition(input:inout [Int], n: Int, strart: Int, end:Int) -> Int{
    var s = strart
    var e = end
    let key = input[s]
    while s < e {
        //从数组最后开始，与key进行比较，如果满足条件，则继续j--,较前面一位的数
        while s < e && input[e] > key {
            e -= 1
        }
        swapListValue(&input, s, e)
        while s < e && input[s] <= key {
            s += 1
        }
        swapListValue(&input, s, e)
    }
    return s
}
