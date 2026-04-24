//
//  LeetCode66.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2026/4/23.
//

import Foundation


func testLeeCode66() {
    let array = [1,6,9]
    let result = plusOneNew(digits: array)
    print(result)
}


private func plusOne(digits: [Int]) -> [Int] {
    var result : [Int] = []
    
    let revers = digits.reversed()
    var jinWei: Int = 0
    var index = 0
    for digit  in revers {
        var plus = digit
        if index == 0 {
            plus = digit + 1
        }
        if plus > 9 {
            result.append(0)
            jinWei = 1
        }else{
            plus += jinWei
            if plus > 9 {
                result.append(0)
                jinWei = 1
            }else{
                result.append(plus)
                jinWei = 0
            }
        }
        index += 1
    }
    if jinWei > 0 {
        result.append(jinWei)
    }
    result = result.reversed()
    return result
}

// 优化版本

func plusOneNew(digits: [Int]) -> [Int] {
    var result = digits
    for i in stride(from: result.count - 1, through: 0, by: -1) {
        result[i] += 1
        if result[i] < 10 {
            return result
        }else{
            result[i] = 0
        }
    }
    result.insert(1, at: 0)
    return result
}
