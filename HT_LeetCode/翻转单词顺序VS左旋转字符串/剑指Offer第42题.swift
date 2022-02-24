//
//  剑指Offer第42题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/12/14.
//

import Foundation

/*
 * 题目一： 输入一个英文句子，翻转句子中单词的顺序，但单词内字的顺序不变，为简单起见，标点符号和普通字母一样处理。
 例如： 输入字符串：“I am a student.”， 则输出student. a am I
 */


func testJianZhiOffer42() {
    let str = "I am a stuedent."
    let result = reverseStr(str: str)
    print(result)
}


func reverseStr(str: String) -> String {
    let s = str.reversed()
    let array = s.split(separator: " ").map { (substring) -> String in
        let temp =  String(substring)
        return String(temp.reversed())
    }
    var result = ""
    for str in array {
        result += str
        result += " "
    }
    return result
}
