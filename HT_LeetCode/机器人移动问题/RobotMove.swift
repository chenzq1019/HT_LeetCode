//
//  RobotMove.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2023/5/29.
//


/***
 1、题目描述

 对于N个格子（从1~N标号），机器人最开始在Start（1<=Start<=N）位置，要求在走过K（K>=1）步后（一次一格），来到aim位置（1<=aim<=N），问机器人有多少种走法？
 **/
import Foundation


func testRobotMove(){
    print(robotMove(current: 2, remain: 6, aim: 4, n: 5))
}

func robotMove(current:Int,remain:Int,aim:Int,n:Int) -> Int{
    if(remain == 0){
        return current == aim ? 1 : 0
    }
    if (current == 1) {
        return robotMove(current: current + 1, remain: remain - 1, aim: aim, n: n)
    }
    else if (current == n) {
        return robotMove(current: current - 1, remain: remain - 1, aim: aim, n: n)
    }
    else{
        return robotMove(current: current - 1, remain: remain - 1, aim: aim, n: n) + robotMove(current: current + 1, remain: remain - 1, aim: aim, n: n)
    }
    
}
//方法二使用动态规划方法
