//
//  剑指offer22题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/24.
//

import Foundation


/**
 * 题目：输入两个整数序列，第一个徐磊表示栈的压入顺序，请判断第二个序列是否为该栈的弹出序列，假设压入栈的所有数字均不相等。例如：序列1、2、3、4、5 是某栈的压入序列，序列4、5、3、2、1是该压栈序列对应的一个弹出序列，但4、3、5、1、2，就不可能是该压栈序列的弹出序列。
 *
 **/

func testJianzhiOffer22() -> Void {
    
    let listPush : [Int] = [ 1,2,3,4,5]
    let listPop : [Int] = [4,5,3,2,1]
    
    let possible = judgePopOrder(pushList: listPush, popList: listPop)
    
    if possible {
        print("复合条件")
    }else{
        print("无法实现")
    }
}

fileprivate func judgePopOrder(pushList: [Int],popList: [Int]) -> Bool{
    var possible = false
    var i = 0
    var j = 0
    let stack : Stack = Stack()
    while j < popList.count {
        if let top = stack.top {
            if top == popList[j]{
                print(stack.pop()!)
                if stack.empty {
                    possible = true
                    break;
                }
                j += 1
            }else{
                if i < pushList.count {
                    stack.push(pushList[i])
                    i += 1
                }else{
                    break
                }
            }
           
        }else{
            stack.push(pushList[i])
            i += 1
        }
 
    }    
    return possible
}
