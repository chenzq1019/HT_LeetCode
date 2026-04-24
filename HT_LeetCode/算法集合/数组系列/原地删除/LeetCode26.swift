//
//  LeetCode26.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2026/4/23.
//

import Foundation


//题目27：移除元素
//给定一个数组 nums 和一个值 val，你需要原地移除所有数值等于 val 的元素，返回移除后数组的
//新长度。

/*
 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。元
 素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
 
 
 给定 nums = [3,2,2,3], val = 3,
 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。
 你不需要考虑数组中超出新长度后面的元素。
 
 
 分析： 使用快慢指针
 */

func testLeeCode26() {
    // 测试数据
    var nums = [1,2,2,3,3,5,2]
    let val = 3
    let count = removeElement(&nums, val)
    print(count)
    print(nums[0..<count])
    var nums1 = [1,2,2,3,3,5,2]
    let diffcount = removeElement2(&nums1)
    print(diffcount)
    print(nums1[0..<diffcount])
    
}


private func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    
    // 1 初始化慢指针
    var slow  = 0
    
    // 2、快指针遍历数组
    for fast in 0..<nums.count {
        //3、如果当前元素不等于目标值val
        if nums[fast] != val {
            // 将该元素移动到慢指针的位置
            nums[slow] = nums[fast]
            // 慢指针前移，准备接收下一个有效元素
            slow += 1
        }
    }
    return slow
}

/*
 删除排序数组中的重复项
 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次。
 
 */


private func removeElement2(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else {
           return 0
    }
    // 1 初始化慢指针
    var slow  = 0
    
    // 2、快指针遍历数组
    for fast in 1..<nums.count {
        //3、如果当前元素不等于目标值val
        if nums[fast] != nums[slow] {
            // 慢指针前移，准备接收下一个有效元素
            slow += 1
            // 将该元素移动到慢指针的位置
            nums[slow] = nums[fast]
        }
    }
    return slow
}
