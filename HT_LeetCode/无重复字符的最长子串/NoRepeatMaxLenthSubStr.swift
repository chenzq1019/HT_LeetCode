//
//  NoRepeatMaxLenthSubStr.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/27.
//

import Foundation

/**
 * 题目： 求出字符串中，最长的无重复字符的子串长度
 *
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    if  s.count <= 0 {
        return 0
    }
    var maxLenth = 0
    var array : Array = Array<Character>.init()
    
//        var set : Set = Set<Character>.init()
//        let firestIndex = s.startIndex
//        var front = 0
//        var back = 0
//        while front < s.count {
//            let index = s.index(firestIndex, offsetBy: front)
//            let currentC = s[index]
//            if set.contains(currentC) {
//                let backIndex = s.index(firestIndex, offsetBy: back)
//                var backC = s[backIndex]
//                while backC != currentC {
//                    set.remove(backC)
//                    back += 1
//                    backC = s[s.index(firestIndex, offsetBy: back)]
//                }
//                back += 1
//            }else{
//                set.insert(currentC)
//                let lenth = front - back + 1
//                if lenth > maxLenth {
//                    maxLenth = lenth
//                }
//            }
//            front += 1
//        }
    

    for c in s {
        let temp = array.firstIndex(of: c)
        if temp != nil {
            var newArray : Array = Array<Character>.init()
            var count = 0
            for character in array {
                if count > temp! {
                    newArray.append(character)
                }
                count += 1
            }
            array.removeAll()
            newArray.append(c)
            array =  newArray

        }else{
            array.append(c)
        }

        maxLenth =  maxLenth > array.count ? maxLenth : array.count
    }
    return maxLenth
}

func lenthSubString(_ s: String) -> Int {
    if  s.count <= 0 {
        return 0
    }
    var maxLenth = 0
    var set : Set = Set<Character>.init()
    let firestIndex = s.startIndex
    var front = 0
    var back = 0
    while front < s.count {
        let index = s.index(firestIndex, offsetBy: front)
        let currentC = s[index]
        if set.contains(currentC) {
            let backIndex = s.index(firestIndex, offsetBy: back)
            var backC = s[backIndex]
            while backC != currentC {
                set.remove(backC)
                back += 1
                backC = s[s.index(firestIndex, offsetBy: back)]
            }
            back += 1
        }else{
            set.insert(currentC)
            let lenth = front - back + 1
            if lenth > maxLenth {
                maxLenth = lenth
            }
        }
        front += 1
    }
    return maxLenth
}

func maxSubStringOf(_ s: String) -> Int {
    var array: Array = Array(repeating: 0, count: 128)
    var maxLenth = 0
    var i = 0
    var j = 0
    for charater in s.unicodeScalars {
        let unicodev  = UnicodeScalar(String(charater))
        if let value = unicodev?.value {
            i = max(i , array[Int(value)])
            array[Int(value)] = j + 1
            maxLenth = max(maxLenth, j - i + 1)
            j += 1
        }
    }
    return maxLenth
}
