//
//  LeeCode10.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2023/5/24.
//
/**
 题目描述：给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。

 '.' 匹配任意单个字符
 '*' 匹配零个或多个前面的那一个元素
 所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。
 示例 1：

 输入：s = "aa", p = "a"
 输出：false
 解释："a" 无法匹配 "aa" 整个字符串。
 
 示例 2:
 输入：s = "aa", p = "a*"
 输出：true
 解释：因为 '*' 代表可以匹配零个或多个前面的那一个元素, 在这里前面的元素就是 'a'。因此，字符串 "aa" 可被视为 'a' 重复了一次。
 
 示例 3：
 输入：s = "ab", p = ".*"
 输出：true
 解释：".*" 表示可匹配零个或多个（'*'）任意字符（'.'）。
  

 提示：

 1 <= s.length <= 20
 1 <= p.length <= 20
 s 只包含从 a-z 的小写字母。
 p 只包含从 a-z 的小写字母，以及字符 . 和 *。
 保证每次出现字符 * 时，前面都匹配到有效的字符

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/regular-expression-matching
 **/
import Foundation

func testLeeCode10(){
    let match = isMatch("aa", "1")
    if match == true {
        print("成功匹配")
    }else {
        print("匹配失败")
    }
}

func isMatch(_ s: String, _ p: String) -> Bool {
    let sArray = Array(s)
          let pArray = Array(p)

          func matchs(_ i: Int, _ j: Int) -> Bool {
              if i < 1 || j < 1 { return false }
              if sArray[i - 1] == pArray[j - 1] || pArray[j - 1] == "." {
                  return true
              }
              return false
          }

          var f: [[Bool]] = Array(repeating:Array(repeating:false, count:p.count + 1), count: s.count + 1)

          f[0][0] = true
          // 注意第j个字符在p中的下标是j - 1，官方解答中有说明
          for i in 0...s.count {
              // f[i > 0][0] == false 恒成立，已经在初始化时赋值了，因此j下标不需要从0开始
              for j in 1...p.count {
                   // 当j为*字符，则j>=2(*字符可能是第一个字符)，所以j-2>=0不会越界, 而matchs保证了i>=1
                   if pArray[j - 1] == "*" {
                     if matchs(i, j - 1) {
                         f[i][j] = f[i][j - 2] || f[i - 1][j]
                     }
                     else { f[i][j] = f[i][j - 2] }
                  } else {
                      if matchs(i, j) { f[i][j] = f[i - 1][j - 1] } // mactchs函数保证了i>=1，不会越界
                  }
              }
          }
          return f[s.count][p.count]
}
