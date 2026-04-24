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
    let steps :Double = 50
//    print(frogJumpNumberSteps(step: steps))
    print(frogJumpNumberStepsDyanmic(step: steps))
    print(frogJumpNumberStepsDyanmic2(step: steps))
}
//用递归的方法
func frogJumpNumberSteps( step: Double) -> Double {
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

//用动态规划，因为如果用递归的化，台阶数变大的，递归会出现内存溢出，而且重复计算次数层指数级提高，效率非常低。
//我们可以用动态规划，例如我们使用数组保存每次计算好的次数。然后每次去上次计算过的最优值，就可以了。

func frogJumpNumberStepsDyanmic(step: Double) -> Double {
    var numbsSetps : [Double] = Array(repeating: 0, count: Int(step))
    var start = 0
    numbsSetps[0] = 0
    numbsSetps[1] = 1
    numbsSetps[2] = 2
    if step < 3 {
        return numbsSetps[Int(step)]
    }
    start = 3
    while start < Int(step) {
        numbsSetps[start] =  numbsSetps[start - 1] + numbsSetps[start - 2]
        start += 1
    }
    return numbsSetps[Int(step-1)]
}

//上面我们使用数组，其实这个不是最好的方法，因为他开辟一个巨大的内存空间，
//其实我们是可以只保留上两次的值就可以了。
func frogJumpNumberStepsDyanmic2(step: Double) -> Double {
    if step <= 0 {
        return 0
    }
    if step == 1 {
        return 1
    }
    if step == 2 {
        return 2
    }
    var start = 3
    var f1 = 1
    var f2 = 2
    var f3 = f2 + f1
    while start < Int(step) {
        f3 = f2 + f1
        f1 = f2
        f2 = f3
        start += 1
    }
    return Double(f3)
}
