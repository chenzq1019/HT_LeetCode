//
//  findNumerInMartrix.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/27.
//

import Foundation
/**
 *在一个二维数组中，每一行都按照从左到右的顺序排序，每一列都按照从上到下的递增的顺序排序，请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否还有该整数。
 
 思路
 {
             {1,2,8,9,10},
             {2,4,9,12,15},
             {4,7,11,13,17},
             {6,8,14,15,19}
         };
 例如以上二维数组如上所示，查找7是否在，可以从数组右上角开始，右上角是10说明该列都会比7大，因此该列可以删除掉，继续去剩下的矩阵中右上角的数据，此时为9，也比7大，因此同理删除此列，继续在右上角查找，直到第二列的2比7小因此可以删除该行，继续查找此时是4，继续删除行，直到找7结束。
 总结：
 从右上角开始查找
 如果大于目标值，则删除列，
 如果小于目标值，则删除行。
 直到找到目标值，或者超出矩阵坐标结束查找。

 *
 */


func testFindNumberInMatrix() -> Void {
    let row1 = [1,2,8,9,10]
    let row2 = [2,4,9,12,15]
    let row3 = [4,7,11,13,17]
    let row4 = [6,8,14,15,19]
    let row5 = [7,13,20,34,40]
    var matrix = [[Int]]()
    matrix.append(row1)
    matrix.append(row2)
    matrix.append(row3)
    matrix.append(row4)
    matrix.append(row5)
    
    if findInMatrixFor(matrix: matrix, target: 15) {
        print("找到了")
    }else{
        print("没有找到")
    }
}

func findInMatrixFor(matrix: [[Int]],target: Int) -> Bool {

    let maxLenth = matrix.count
    var i = 0
    var j = maxLenth-1
    while true {
        if i >= maxLenth {
            return false
        }
        if j < 0 {
            return false
        }
        if matrix[i][j] < target {
            i += 1
        }else if matrix[i][j] > target {
            j -= 1
        }else {
            return true
        }
    }
}
