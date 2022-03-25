//
//  HT_SortDemo.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/27.
//

import Foundation
//交换数组中两个数值
public func swapListValue(_ list: inout [Int],_ i: Int,_ j: Int) -> Void {
    if i != j {
        list[i] = list[i] ^ list[j]
        list[j] = list[i] ^ list[j]
        list[i] = list[i] ^ list[j]
    }
}

//交换两个数值
public func swapInt(_ a:inout Int,_ b:inout Int) -> Void {
    if a != b {
        a = a ^ b
        b = a ^ b
        a = a ^ b
    }
}



func testSortFunction() -> Void {
//    let list = [6,1,5,9,2,3,10,20,90,32,7,8]
//    let list = [6,1,5,9,2,3,10]
    let list = [2,1,5,7,8,9,4,3]
    
    let sort = bubleSort(list: list){$0 > $1}
    print(sort)
    let sort2 = selectSort(list: list) {$0 < $1}
    print(sort2)
    let sort3 = insertSort(list: list){ $0 > $1}
    print(sort3)
    let sort4 = quikSortArray(list: list) { $0 > $1}
    print(sort4)
    let sort5 = mergeSortArray(list)
    print(sort5)
    
    let sortArray = [10,20,40,50,60,90,100,120]
    
    let targetArray = [10,20,50,90,80]
    
    for target in targetArray {
        var findcount = 0;
        if let resutl = binarySearch(array: sortArray, target: target, start: 0, end: sortArray.count-1,total: &findcount) {
            print("找到了数字\(resutl)")
            print("找了\(findcount)次")
        }else{
            print("找不到")
        }
    }
    
}

//MARK:-  冒泡法 排序
/**
 *一、冒泡法
 *每次循环通过比较相邻两个数的大小，交换位置，
 *步骤：
 *1、第一层循环，从0...n
 *2、第二层循环，从0...n-1-i
 *3、比较相邻两个数的大小，然后交换位置
 */

func bubleSort(list: [Int],_ sortBlock : (_ a: Int,_ b: Int) -> Bool) -> [Int] {
    var sortList = list
    for i in 0..<list.count {
        for j in 0..<list.count-1-i {
            if sortBlock(sortList[j+1],sortList[j]) {
                sortList[j] = sortList[j] ^ sortList[j+1]
                sortList[j+1] = sortList[j] ^ sortList[j+1]
                sortList[j] = sortList[j] ^ sortList[j+1]
            }
        }
    }
    return sortList
}
//MARK:-  选择排序法
/**
 * 二、选择排序法
 *
 *分析： 选择排序是通过遍历一次找到一个最大值或者最小值，然后交换位置。
 *进阶的方法是同时找到最大和最小的数
 *下次遍历在找出剩下的最大值和最小值。
 *关键在于每次循环你能够选择出一个最大或者小的数。
 *例如：如果是从小到大排序。
 *则每次循环将最大的数放在最后面，最小的数放在最前面。
 *
 */

func selectSort(list:[Int],_ sortBlock: (_ a: Int, _ b: Int) -> Bool) -> [Int] {
    var sortList = list
    let count = list.count
    //(sortList.count-1)/2 是因为每次循环找到了最大和最小的值，因此只需要遍历一半的次数
    for i in 0..<(sortList.count-1)/2 {
        for j in i..<(sortList.count-i) {
            
//            if sortBlock(sortList[i], sortList[j]) {
//                sortList[i] = sortList[i] ^ sortList[j]
//                sortList[j] = sortList[i] ^ sortList[j]
//                sortList[i] = sortList[i] ^ sortList[j]
//            }
            //找出最大值放在最前面（可以使用尾随闭包来判断）
            if /*sortList[j] > sortList[i]*/ sortBlock(sortList[j],sortList[i]) {
                sortList[i] = sortList[i] ^ sortList[j]
                sortList[j] = sortList[i] ^ sortList[j]
                sortList[i] = sortList[i] ^ sortList[j]
            }
            //找出最小值放在最后面（可以使用尾随闭包来判断）
            if /*sortList[j] < sortList[count-1-i] */sortBlock(sortList[count-1-i],sortList[j]){
                sortList[j] = sortList[j] ^ sortList[count-1-i]
                sortList[count-1-i] = sortList[j] ^ sortList[count-1-i]
                sortList[j] = sortList[j] ^ sortList[count-1-i]
            }

        }
    }
    return sortList
}

//MARK:- 插入排序
/**
 * 三、插入排序
 *分析：循环从第二位开始跟前面的数进行比较，如果满足条件，则交换两个相邻的位置，
 *然后继续往前一位进行比较。一直到数组的起始位置。
 *该算法的关键是，从数组的第二位开始往前比较。
 *一种是满足条件的数往后挪，最好，把当的数放在空位。
 *一种是满足提交的数直接交换就可以，交换成功后，往前挪移一位继续比较。这样就一直保证前面的数是有序的。
 *
 *所以，插入排序的关键是保证前面的数一直有序。将新的数值通过比较，插入到前面合适的位置。
 *
 *
 */

func insertSort(list: [Int],sortBlock:(_ a:Int,_ b: Int)->Bool) -> [Int] {
    var sortList = list
    
    for i in 1..<sortList.count {
        var j = i - 1
        var k = i
        while j >= 0 {
            if  sortBlock(sortList[k],sortList[j]) {
                swapListValue(&sortList, k, j)
                k = j
            }else{
                break
            }
            j -= 1
        }
    }
    
    return sortList
}

//MARK:-快速排序法
/**
 * 四、快速排序法
 *
 *分析说明：
 *首先，我们可以取目标数组中第一个元素作为我们key值。并设置i，j两个坐标点，指向第一个元素，j指向最后一个元素
 *然后，我们从数组最后一位开始，遍历的跟key值比较。如果满足条件，则j的位置--，也就是向前移动。否则，说明最后遍历的数值，不符合条件，我们就跟i所指向的位置进行交换。
 *接着，我们就从i的位置开始遍历，如果满足提交，i++,也就是向后移动一位，直到不满足条件，
 *然后，我们将不满足条件的i与j所指向的值交换位置。
 *
 *完成一次遍历。
 *
 *快速排序的思路是： 利用一个key值，将数组分割成两个部分，一部分的所有元素都比key值小，一部分所有的元素都比key值大。
 *然后，不断地将数组分割成两部分，最后数组就是一个有序数组了。
 */

func quikSortArray(list:[Int], _ block:(_ a: Int,_ b: Int)->Bool) -> [Int] {
    var sortList = list
    quickSort(list: &sortList, start: 0, end: sortList.count - 1)
    return sortList
}

func quickSort(list:inout [Int], start: Int, end: Int) -> Void {
    if start > end {
        return
    }
    var low = start
    var high = end
    let key = list[low]
    while low < high {
        //从数组最后开始，与key进行比较，如果满足条件，则继续j--,较前面一位的数
        while low < high && list[high] >= key {
            high -= 1
        }
        //说明从后面找到一个不符合条件的j，然后我们与i进行交换
        swapListValue(&list, low, high)
        //然后从头位置点开始遍历的与key值进行比较，如果满足添加i++，
        while low < high && list[low] <= key {
            low += 1
        }
        //再次交换
        swapListValue(&list, low, high)
    }
    list[low] = key;
    quickSort(list: &list, start: low+1, end: end)
    quickSort(list: &list, start: start, end: low-1)
    
}

//MARK: - 归并排序

func mergeSortArray(_ list: [Int]) -> [Int] {
    let sortList = list
    return mergeSortBy(sortList, start: 0, end: sortList.count - 1)
}

func mergeSortBy(_ list: [Int], start: Int,end: Int) -> [Int] {
    if start >= end {
        return [list[start]]
    }
    let midle = (end + start) / 2
    let array1 = mergeSortBy(list, start: start, end: midle)
    let array2 = mergeSortBy(list, start: midle+1, end: end)
    return mergeArrays(array1, array2)
}

func mergeArrays(_ array1:[Int],_ array2:[Int]) -> [Int] {
    var i = 0
    var j = 0
    var result = [Int]()
    while i < array1.count &&  j < array2.count {
        if array1[i] > array2[j] {
            result.append(array2[j])
            j += 1
        }else {
            result.append(array1[i])
            i += 1
        }
    }
    while i < array1.count {
        result.append(array1[i])
        i += 1
    }
    while j < array2.count {
        result.append(array2[j])
        j += 1
    }
    return result
}


//二分查找
fileprivate func binarySearch(array: [Int], target: Int ,start: Int,end: Int , total: inout Int) -> Int? {
    if start > end {
        return nil
    }
    total += 1
    let first = start
    let end = end
    let mid :Int = start + (end - first) / 2
    if array[mid] == target {
        return target
    }
    if array[mid] > target {
        return binarySearch(array: array, target: target, start: first ,end: mid - 1,total: &total)
    }
    if array[mid] < target {
        return binarySearch(array: array, target: target, start: mid + 1, end: end,total: &total)
    }
    return nil
}
