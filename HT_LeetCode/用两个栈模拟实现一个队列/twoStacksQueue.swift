//
//  twoStacksQueue.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/4.
//

import Foundation

class HTQueue {
    var stack1: [Any] = []
    var stack2: [Any] = []
    
    func appendTail(value: Any) -> Void {
        stack1.append(value)
    }
    
    func removeHead() -> Any? {
        if stack2.count <= 0 {
            stack2 = stack1.reversed()
        }
        return stack2.removeLast()
    }
}
