//
//  ViewController.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/25.
//

import UIKit

public class TreeNode{
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        test()
//        testDoubleLinke()
        
//        testSumEqualTo()
        
//        testMatchSqure()
        
        testFromJumpSteps()
//        testPrintBinaryTree()
        
//        print(findMaxlenthPalindromicNumber(str: "abcdc"))
        
//        testRepeatDNA()
//        testHuiwenShu()
//        testMergeTwoList()
//          testSortFunction()
//        testFindNumberInMatrix()
//        testInvertOrderPrintLink()
//        testBuildBinaryTree()
//
//        let queue = HTQueue()
//        queue.appendTail(value: 1)
//        queue.appendTail(value: 2)
//        queue.appendTail(value: 3)
//        queue.appendTail(value: 4)
//
//        print("delete head \(queue.removeHead() ?? "")")
//        print("delete head \(queue.removeHead() ?? "")")
//        print("delete head \(queue.removeHead() ?? "")")
//
//        queue.appendTail(value: 5)
//        print("delete head \(queue.removeHead() ?? "")")
//        testRotatoArray()
//        testPrintNumber();
//        testDeleNodeMain()
//        testJianzhiOffer14()
//        testJianzhiOffer15()
//        testJianzhiOffer16()
//        testJianzhiOffer19()
//        testJianzhiOffer20()
//         testJianzhiOffer21()
        testJianzhiOffer22()
    }


}

