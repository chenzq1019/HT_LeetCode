//
//  LeeCode669.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2023/5/24.
//
/**
 
 
 669 · 换硬币
 描述
 给出不同面额的硬币以及一个总金额. 写一个方法来计算给出的总金额可以换取的最少的硬币数量. 如果已有硬币的任意组合均无法与总金额面额相等, 那么返回 -1.
 
 动态规划
 **/

import Foundation

func testLeeCode669(){
    print(coinChange([1,2,5], 11))
}


func coinChange(_ coins: Array<Int>, _ amount: Int) -> Int {
    // write your code here
    
    var dp = Array(repeating: 9999, count: amount+1)
    dp[0] = 0
    for i in 1...amount {
        for corin in coins {
            if(i-corin) < 0 {
                dp[i] = min(dp[i], Int.max)
            }else{
                dp[i] = min(dp[i], dp[i-corin]+1)
            }
        }
    }
    
    return dp[amount]
    
}
