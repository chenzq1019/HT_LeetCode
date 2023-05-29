//
//  hannuotaTest.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2023/5/29.
//

import Foundation


func testHanNuoTa(){
    var step = 0
    move(num: 5, A: "A", B: "B", C: "C", step: &step)
    print("一共\(step) 步")
    dynamicMove(num: 5, A: "A", B: "B", C: "C", step: &step)
    
    //测试二维数组
    var test :[[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    print(test)
}

//方法一，递归的方法
func move(num:Int,A:String,B:String,C:String,step: inout Int) ->Void {
    if(num == 1){
        print("move From \(A) to \(C)")
        step += 1
    }else{
        move(num: num-1, A: A, B: C, C: B, step: &step)
        move(num: 1, A: A, B: B, C: C,step: &step)
        move(num: num-1, A: B, B: A, C: C, step: &step)
    }
    
}

//动态规划 计算一共多步
//状态方程： f(n) = 2*f(n-1) +1
func dynamicMove(num:Int,A:String,B:String,C:String,step:inout Int) -> Void{
    if(num == 0){
        return
    }
    var array = Array(repeating: 0, count: num+1)
    array[1] = 1
    for i in 2...num {
        array[i] = 2*array[i-1] + 1
    }
    print(array[num])
}
