//
//  repeatDNA.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/26.
//

import Foundation

/**
 * 题目：重复的DNA序列
 * 所有DNA有一系列缩写为A、C、G和T的核苷酸组成，例如：“ACGAATTCCG”
 * 编写一个函数来查找 DNA 分子中所有出现超过一次的10个字母长的序列（子串）。
 *
 *分析：题目中要求从已知的字符串中查一个长度为n的子字符串，且该子字符串在总的字符串中出现的次数超过1次。
 *因此，我们可以首先固定一个长度为n的子字符串，
 *可从字符串起始位置开始，取一个长度为n的子串，并存在字典中，记次数为1
 *然后移动该子串，如果字典中存在子串则次数加1，否则存在字典中。
 *依次类推
 *一直到字符串结束为止。
 *最后，从字典中取出次数超过1的子串，就是我们需要的答案
 *
 **/

func testRepeatDNA() -> Void {
    let str = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
    if let array = findRepeatDNAStr(str: str, lenth: 4), array.count > 0 {
        print(array)
    }else {
        print("没有找到")
    }
}

func findRepeatDNAStr(str:String,lenth:Int) -> [String]? {
    if lenth > str.count {
        return nil
    }
    var dic: [String: Int] = [String:Int]()
    var i = 0
    while i < str.count - lenth {
        let substr = String(str[i..<(i+lenth)])
        if let find = dic[substr] {
            let num = find + 1
            dic[substr] = num
        }else {
            dic[substr] = 1
        }
        i += 1
    }
    var result : [String]? = []
    for (key,value) in dic {
        if value > 1 {
            result?.append(key)
        }
    }
    return result
    
}
