//
//  剑指offer28题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/1/4.
//

import Foundation

/**
 *  题目：输入一个字符串，打印出该字符串中字符的所有排列，例如输入字符串abc，则打印出字符a、b、c所能排列的所欲字符串abc，acb，bac，bca，cab和cba。
 *
 *  分析：这个是一个全排列，可以将问题分成两部分，首先固定第一位，将后面所有的字符作为一部分。然后交换第一位与所有后面字符的位置。然后调用递归同样方式处理后面部分的字符串。例如：
 *  首先 a 固定，将bc左右一个整体，
 *  然后循环交换a与b、c的位置。形成abc，cba 。
 *  将bc作为一个新字符，调用递归同样处理 固定b ，将c作为另一部分。
 *  然后得的就是bc 、cb
 *
 *  进阶：如果不是求字符的所有排列，而是求字符的所有组合，应该怎么办呢。
 *  还是输入三个字符a、b、c，则他们的组合有a、b、c、ab、ac、bc、abc，当交换字符串中的两个字符时，虽然能够得到两个不同的排列，但是却是同一个组合，比如ab和ba是同一个组合。
 *  方法：
 *  1、如果输入n个字符，则这n'个字符能构成长度为1的组合、长度为2的组合、。。。。、一直到长度为n的组合。
 *  2、在求n个字符的长度为m的组合的时候，我们把这n个字符分成两部分：第一个字符和其他的所有字符。如果组合里包含第一个字符，则下一步在剩余的字符里选取m-1个字符。如果第一个不包含第一个字符，则下一步在剩余的n-1个字符里面选取m个字符。
 *
 *  拓展：
 *  题目1： 输入一个含有8个数字的数组，判断有没有可能把这8个数字分别放到正方体的8个顶点上，使得正方体上三组相对的面上的4个顶点的和都相等。
 *  分析：
 *  这相当于先得到a1 a2 a3 a4 a5 a6 a7 a8这8个顶点数字的所有排列，然后判断有没有某一个排列符合给定的条件。即：
 *  a1+a2+a3+a4 = a5+a6+a7+a8, a1+a3+a5+a7=a2+a4+a6+a8, 并且a1+a2+a5+a6 == a3+a4+a7+a8
 *
 */


func testJianzhiOffer28() -> Void {
  let str = "abc"
    let strArray : [Character] = str.map { (char : Character) -> Character in
        return char
    }
    //字符全排列
//    permutation(str: strArray, start: 0)
    //字符的所有组合
    permutationCompose(strs: str)
}

fileprivate func permutation(str: [Character], start: Int) ->Void{
    var strArray = str
    //终止条件是start 已经到了字符最末端了。
    if start >= strArray.count-1 {
        var resultStr : String = ""
        for char in strArray {
            resultStr.append(char)
        }
        print(resultStr)
        return
    }
    for i in start..<strArray.count {
        //交换位置，
        var temp = strArray[start]
        strArray[start] = strArray[i]
        strArray[i] = temp
//        print(strArray)
        permutation(str: strArray, start: start+1)
        //注意 这里还需要将上次交换的位置，恢复到之前的位置，是为了下次交换的时候，还是原来的字符。
        //这是一种回溯的思想，即回到上次交换前的状态。用于下次新的尝试。
        temp = strArray[start]
        strArray[start] = strArray[i]
        strArray[i] = temp
        
    }
}

fileprivate func permutationCompose(strs:String)->Void{
    let strArray = strs
    var result:[String] = []
    for i in 1...strArray.count {
        perm(strs: strs, m: i, result: &result)
    }
}

fileprivate func perm(strs: String, m: Int, result:inout [String])->Void {
    
    if m == 0 {
        var comStr : String = ""
        for i in 0..<result.count {
            comStr = comStr + result[i]
        }
        print(comStr)
        return
    }
    
    if strs.count != 0 {
        //取第一个字符
        result.append(String(strs[0]))
        let index_start = strs.index(strs.startIndex, offsetBy: 1)
        let index_end = strs.index(strs.startIndex, offsetBy: strs.count)
        let subStr = String(strs[index_start..<index_end])
        //从剩余的字符串中，选取m-1个字符
        perm(strs: subStr, m: m - 1, result: &result)
        //不选取第一个字符
        result.remove(at: result.count - 1)
        //从剩余的字符串中，选取m个字符
        perm(strs: subStr, m: m, result: &result)
    }
}

