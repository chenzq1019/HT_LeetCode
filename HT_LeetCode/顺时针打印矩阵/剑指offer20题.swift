//
//  剑指offer20题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/12/23.
//

import Foundation

/**
 * 题目： 输入一个矩阵，按照从外向里以顺时针的书序一次打印出每一个数字，例如输入
 * 1  2  3  4
 * 5  6  7  8
 * 9  10 11 12
 * 13 14 15 16
 *
 *依次打印的顺序为： 1 2 3 4 8 12 16 15 14 1 3 9 5 6 7 11 10
 *
 * 分析： ----——->
 *       |     |
 *       |     |
 *       |     |
 *      <----- v
 */


func testJianzhiOffer20() -> Void {
    var martix : [[Int]] = []
    let row1 = [1,2,3,4]
    martix.append(row1)
    let row2 = [5,6,7,8]
    martix.append(row2)
    let row3 = [9,10,11,12]
    martix.append(row3)
    let row4 = [13,14,15,16]
    martix.append(row4)

    let row5 = [17,18,19,20]
    martix.append(row5)

    printMatrixClockwisely(numbers: martix, columns: 4, row:5)
}

fileprivate func printMatrixClockwisely(numbers: [[Int]], columns:Int, row: Int) ->Void{

    var start : Int = 0
    //关键是结束循环的条件是，开始起点的坐标 * 2，必须同时小于行数和列数。只要有一个不满足就结束循环
    while (columns > start * 2) && (row > start * 2) {
        let endX = columns - 1 - start
        let endY = row - 1 - start
        //从左到右，这个是第一次肯定会执行的，并且完整打印一行
        
        for i in start...endX {
            print(numbers[start][i])
        }
        
        //从上到下，要从上面一行的下面开始完整打印一列
        if start < endY{
            for j in (start+1)...endY {
                print(numbers[j][endX])
            }
        }
        
        //从右到左
    
        if start < endX && start < endY {
            for m in (start...(endX-1)).reversed() {
                print(numbers[endY][m])
            }
        }
        //从下到上
        if start < endX && start < endY - 1 {
            for n in ((start+1)...(endY-1)).reversed() {
                print(numbers[n][start])
            }
            
        }
        start += 1
    }
}
