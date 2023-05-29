//
//  LeeCode179.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2023/5/23.
//
/**
 1、给定一个Int型数组，用里面的元素组成一个最大数，因为数字可能非常大，用字符串输出。
 **/

import Foundation


func testLeeCode179(){
    let array = [3,30,34,5,9]
    print(combinLargestNumber(array: array))
}

func combinLargestNumber(array:[Int]) -> String{
    let sort = array.map{"\($0)"}.sorted { (lStr, rStr) in
        return lStr + rStr > rStr + lStr
    }
    let result = sort.joined()
    if result.prefix(1) == "0" {
        return "0"
    }else{
        return result
    }
}
