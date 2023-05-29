//
//  LeeCode11.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2023/5/24.
//

import Foundation


func testLeeCode11(){
  print(maxArea([1,8,6,2,5,4,8,3,7]))
}


func maxArea(_ height: [Int]) -> Int {
    let array = height
    var left = 0
    var right = array.count - 1
    var max = 0
    while (left <= right){
        let width = right - left
        let h = min(array[left],array[right])
        let square = width * h
        if (square > max){
            max = square
        }
        if array[left] > array[right] {
            right -= 1
        }else {
            left += 1
        }
    }
    return max
}
