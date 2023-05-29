//
//  LeeCode08.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2023/5/23.
//

import Foundation

func testLeeCode08(){
    print(myAtoi("21474836460"))
}

    func myAtoi(_ s: String) -> Int {
        let charArray: [Character] = Array(s)
        //1 去掉空格
        var index = 0;
        while index < charArray.count {
            if charArray[index] == " " {
                index += 1
            }else{
                break
            }
        }
        var positive = 1
        var result = 0
        if index < charArray.count{
            //判断正数负数
            if(charArray[index] == "-"){
                positive = -1
                index += 1
            }else if (charArray[index] == "+"){
                positive = 1
                index += 1
            }
            print(Int32.max)
        }

        //解析数字
        while index < charArray.count {
            if charArray[index] >= "0" && charArray[index] <= "9" {
                result = result * 10 + Int(String(charArray[index]))!
                if result * positive < Int32.min {
                    result = -Int(Int32.min)
                    break
                }else if result * positive > Int32.max {
                    result = Int(Int32.max)
                    break
                }
            }else{
                break
            }
            index += 1
        }
      
        return result * positive
    }

