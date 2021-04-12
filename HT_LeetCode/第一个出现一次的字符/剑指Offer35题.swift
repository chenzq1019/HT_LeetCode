//
//  剑指Offer35题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/3/3.
//

import Foundation
/**
 * 题目：在字符串中找出第一个只出现一次的字符，如输入“abaccdeff”,则输出“b”
 *
 * 分析：
 *
 **/

func testJianzhiOffer35() -> Void {
    if let firstNorepeatChar = firstNotRepeatChar(pString: "abaccdeff") {
        print(firstNorepeatChar)
    }
}

fileprivate func firstNotRepeatChar(pString: String) -> Character?{
    if pString.count <= 0 {
        return nil
    }
    var hasTable:[Int] = Array.init(repeating: 0, count: 256)
    for char in pString {
        hasTable[Int(char.asciiValue!)] += 1
    }
    for char in pString {
        if hasTable[Int(char.asciiValue!)] == 1 {
            return char
        }
    }
    return nil
}
