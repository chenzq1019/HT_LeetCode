//
//  jianzhioffer21题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/24.
//

import Foundation

/**
 * 题目：定义栈的数据结构，请扎起该类型中实现一个能够得到栈的最小元素的min函数，在该栈中，调用min，push以及pop的时间复杂度都是O(1)。
 *
 * 分析： 利用两个数组，容量一样大，第一个数组实现栈的功能，第二个数组实现最小值的功能，每次push一个新值的时候，都跟上一次最小值做比较，如果小于之前的最小值，则在第二个数组中入栈一个新的最小值，否则使用旧的最小值。
 */

func testJianzhiOffer21() -> Void {
    let myMinStack : Stack = Stack()
    myMinStack.push(3)
    myMinStack.push(4)
    myMinStack.push(8)
    myMinStack.push(2)
    myMinStack.push(9)
    myMinStack.push(1)
    myMinStack.push(5)
    myMinStack.pop()
    myMinStack.pop()
    myMinStack.pop()
    myMinStack.pop()
//    myMinStack.push(1)
    if let min = myMinStack.min() {
        print("minValue = \(min)")
    }
    
}


class Stack {
    var list : [Int] = []
    var minList : [Int] = []
    var top : Int? {
        get{
            return self.list.last
        }
    }
    var empty: Bool {
        get {
            return self.list.count > 0 ? false:true
        }
    }
   
    func push(_ a: Int) -> Void {
        if let min = minList.last {
            if min > a {
                minList.append(a)
            }else{
                minList.append(min)
            }
        }else{
            minList.append(a)
        }
        list.append(a)
    }
    func pop() -> Int? {
        var a: Int? = nil
        if list.count > 0 {
            a = list.last
            list.removeLast()
            minList.removeLast()
        }
        return a
    }
    
    func min() -> Int?{
        let min: Int? = minList.last
        return min
    }
    

    
}
