//
//  LeeCode14.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2022/7/19.
//

import Foundation


/**
 题目：最长公共前缀
 
 编写一个函数来查找字符串数组中的最长公共前缀，如果不存在公共前缀则返回空
 
 示例：
 输入： ["flower","flow","flight"]
 输出： "fl"
 
 示例：
 输入： ["dog","cacecar", "car"]
 输出： ""
 
 */

func testLeeCode14(){
    
    let prefix = longestCommonPrefix(strs: ["flower","flow","flight"])
    print(prefix)
}


fileprivate func longestCommonPrefix(strs: [String]) -> String {
    if strs.count == 1 {
        return strs[0]
    }
    var target = strs[0]
    for tempStr in strs {
        while !tempStr.hasPrefix(target) {
            let sub1 = target.index(target.startIndex, offsetBy: 0)
            let sub2 = target.index(target.startIndex, offsetBy: target.count-1)
            target = String(target[sub1..<sub2])
        }
    }

    return target
}

