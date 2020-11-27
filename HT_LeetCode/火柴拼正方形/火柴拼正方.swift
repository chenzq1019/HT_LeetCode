//
//  火柴拼正方.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/26.
//

import Foundation

/**
 题目： 给定一个值，数组中的数值表示火柴的长度，返回一个结果是否能够拼出一个正方形
 题目分析：
 1、如果能够拼成一个正方形，则数组中的数值之和应该是4的整数倍。
 2、数组中任意一个数值，不能大于边长
 3、我们将四边形的四个边，假设为四个容器。而数组中的数值则可以假设为不同容量的液体。题目转化为如何将
 四个容器都装满水的题目。
 4、因此我们可以考虑使用回溯法的思路。
 5、首先将数组进行从大到小的排序，这样就能减少我们后面的回溯次数。
 步骤：
 1、判断是否可以组成正方形。
 2、排序
 3、依次将数组中的值放入的四个容器中，利用回溯法。
 */

func testMatchSqure() -> Void {
        
    let matchs :[Int] = [1,1,2,2,2,3,4,5]  //[1,1,2,2,4,5,6,7]
    if matchSquareFor(list: matchs) {
        print("可以组成正方形")
    }else{
        print("不可以组成正方形")
    }
}


func matchSquareFor(list:[Int]) -> Bool {
    if list.count < 4 {
        return false
    }
    var toaltLenth = 0
    for value in list {
        toaltLenth += value
    }
    if toaltLenth <= 0 || toaltLenth % 4 != 0 {
        return false
    }
    let max = Int(toaltLenth / 4)
    var container : [Int] = [0,0,0,0]
    //降序排列
    let matchs = list.sorted { (a, b) -> Bool in
        return a > b
    }
    return recallMatch(at: 0, list: matchs, squareW: max, container: &container)
   
}

func recallMatch(at: Int,list: [Int], squareW:Int,container:inout [Int]) -> Bool {
    //如果当前火柴已经大于火柴数目，表明所有火柴都已经找到正确的位置放完了。
    if at >= list.count {
        return true
    }
    //遍历容器
    for i in 0..<4 {
        //如果当前容器放不下，则继续
        if container[i] + list[at] > squareW {
            continue
        }
        //将其放入到容器中
        container[i] = container[i] + list[at]
        //开始取下一个火柴放入到容器中,如果所有都放入了容器中则返回true
        if recallMatch(at: at + 1, list: list, squareW: squareW, container: &container) {
            return true
        }
        //否则表明下一个火柴没有位置放了，则需要回溯到上一个火柴的位置。
        //所以，将当前容器中放入的火柴取出来。
        container[i] = container[i] - list[at]
    }
    return false
}
