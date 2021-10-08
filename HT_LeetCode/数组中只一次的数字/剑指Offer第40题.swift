//
//  剑指Offer第40题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/7/8.
//

import Foundation

/**
 * 题目：一个整型数组里除了两个数字之外，其他的数字都出现了两次。请写程序找出这个两个只出现一次的数字，要求时间复杂度是O(n)。空间复杂度是O(1)
 */


func testJianzhiOffer40(){
    
    
    var num1 = 0;
    var num2 = 0
    findNumsAppearOnce(data: [2,4,3,6,3,2,5,5], length: 8, num1: &num1, numb2: &num2)
    print(num1)
    print(num2)
}


private func findNumsAppearOnce(data: [Int]?, length: Int, num1:inout Int,numb2:inout Int){
    if data == nil || length < 2 {
        return
    }
    guard let array = data else { return  }
    var resultExclusiveOR : Int = 0
    for value in array {
       resultExclusiveOR ^= value
    }
    let indexOf1 : Int = findFirstBitIs1(num: resultExclusiveOR)
    num1 =  0
    numb2 = 0
    for value in array {
        if isBit1(num: value, indexBit: indexOf1) {
            num1 ^= value
        }else{
            numb2 ^= value
        }
    }
}

private func findFirstBitIs1(num: Int) -> Int{
    var indexBit : Int = 0
    var n = num
    while (n & 1 == 0)  {
        n = n >> 1
        indexBit += 1
    }
    return indexBit
}

private func isBit1(num : Int, indexBit: Int) -> Bool{
    var n :Int = num
    n = n >> indexBit
    return ((n & 1) != 0)
}
