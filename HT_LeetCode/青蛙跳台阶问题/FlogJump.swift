//
//  FlogJump.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/26.
//

import Foundation

/**
 题目： 一个n阶的台阶，一只青蛙每次可以跳一阶或则两阶，问，完成n阶台阶，一共有多少种跳法。
 
 题目分析：我们可以使用动态规划来做，
 
 首先，如果是0阶，就是0个方法。 f（0） =0
 其次，如果是1阶，则有1中跳法f（1） = 1
 如果是2阶，则两种跳法：一次跳一阶，或者一次跳两阶  f(2)= 2
 如果是3阶，可以先跳一阶 剩下两阶 这用跳法总数是 f（2）
          可以先跳两阶，剩下1阶，这种跳法总数是 f（1）
            因此总的次数是 f（3）= f（2） + f（1）
 如果是4阶，先跳一阶：剩下三阶，总数是 f（3）
          先跳两阶： 剩下两阶： 总数是 f(2)
          总的次数为： f（4 ） = f(3) + f(20
 
 */

func testFromJumpSteps() -> Void {
    let steps = 10
    print(frogJumpNumberSteps(step: steps))
}

func frogJumpNumberSteps( step: Int) -> Int {
    if step <= 0 {
        return 0
    }
    if step == 1 {
        return 1
    }
    if step == 2 {
        return 2
    }
    return frogJumpNumberSteps(step: step - 1) + frogJumpNumberSteps(step: step - 2)
}
