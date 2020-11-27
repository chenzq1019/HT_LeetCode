//
//  palindromicNumber.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/26.
//

import Foundation

/**
 题目： 所谓回文字符，就是字符串首尾相同的字符例如：
 a
 aa
 aba
 abba
 abccba
 这些都是回文字符
 那么如何从已知的字符串中找到最长的回文字符呢，通常的想法是通过暴力循环的形式找到回文字符，然后从回文字符中找到最长的字符。
 那样做效率非常低，那么我们更好的方法吗？答案是肯定的。我们可以利用动态规划的方法来做：
 首先，我们观察回文子的规律是首尾相同，也就是一个回文字符中，首尾添加一个相同的字符那么这个新的字符就肯定也是一个回文字符，否则就不是。
 也就是 如果么知道 字符串str[i] ==str[j], 我们就只需要判断 a[i+1][j-1] 这个区间中的字符是不是回文就可以。
 
 步骤：
 1，首先定义一个二维数组，用于存放字符串区间内是否为回文字符串。例如 flage[i][j] ==  1 表明字符串i-->j位置内的字符串是回文字符串
 
 2、从字符串尾部开始遍历判断当前是否是回文字符，单个字符为回文字符串
 
 3、如果是两个字符，只有相等才是回文字符串
 
 4、超过2个的字符，判断字符中间的是否是回文字符串，并判断头尾是否相同。
 
 
 */


func findMaxlenthPalindromicNumber(str: String) -> String{
    
    //首先定义个二维数组
    var flagArray : [Array<Int>] = [[Int]]()
    for _ in 0..<str.count {
        var subArray: [Int] = []
        for _ in 0..<str.count {
            subArray.append(0)
        }
        flagArray.append(subArray)
    }
    var result : String = ""
    for (i,_) in str.enumerated().reversed() {
        var tempStr : String = ""
        for j in i..<str.count {
            if j == i {
                flagArray[i][j] = 1
                tempStr = String(str[i])
            }else if j - i == 1 && String(str[j]) == String(str[i]){
                flagArray[i][j] = 1
                tempStr = String(str[i...j])
            }else if String(str[j]) == String(str[i]) && flagArray[i+1][j-1] == 1{
                flagArray[i][j] = 1
                tempStr = String(str[i...j])
            }
            
            if result.count < tempStr.count {
                result = tempStr
            }
        }
 
    }
    return result
}



extension String {
    func substingInRange(_ r: Range<Int>) -> String? {
           if r.lowerBound < 0 || r.upperBound > self.count {
               return nil
           }
           let startIndex = self.index(self.startIndex, offsetBy:r.lowerBound)
           let endIndex   = self.index(self.startIndex, offsetBy:r.upperBound)
           return String(self[startIndex..<endIndex])
    }
    
    func charaterAtIndex(index: Int) -> Character? {
        var result: Character?
        for (i,char) in self.enumerated() {
            if i == index {
                result = char
            }
        }
        return result
    }
    
    
    
}

extension String {
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
  subscript (bounds: CountableRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ..< end]
  }
  subscript (bounds: CountableClosedRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ... end]
  }
  subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(endIndex, offsetBy: -1)
    return self[start ... end]
  }
  subscript (bounds: PartialRangeThrough<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ... end]
  }
  subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ..< end]
  }
}
extension Substring {
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
  subscript (bounds: CountableRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ..< end]
  }
  subscript (bounds: CountableClosedRange<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[start ... end]
  }
  subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
    let start = index(startIndex, offsetBy: bounds.lowerBound)
    let end = index(endIndex, offsetBy: -1)
    return self[start ... end]
  }
  subscript (bounds: PartialRangeThrough<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ... end]
  }
  subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
    let end = index(startIndex, offsetBy: bounds.upperBound)
    return self[startIndex ..< end]
  }
}
