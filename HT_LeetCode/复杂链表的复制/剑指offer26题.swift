//
//  剑指offer26题.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2021/1/4.
//

import Foundation


/**
 * 题目：请实现函数ComplexListNode，复制一个复杂链表。在复杂链表中，每个节点除了有一个m_pNext指针指向下一个节点外，还有一个m_pSibling指向链表中的任意节点或者NULL，节点的定义如下：
 *
 *
 **/

class ComplexListNode {
   public var m_nValue: Int
   public var m_pNext: ComplexListNode?
   public var m_psibing: ComplexListNode?
    init(_ value: Int) {
        m_nValue = value
    }
}

extension ComplexListNode: Hashable{
    static func == (lhs: ComplexListNode, rhs: ComplexListNode) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(m_nValue)
    }
}

func testJianzhiOffer26() -> Void {
    let A : ComplexListNode = ComplexListNode(1)
    let B : ComplexListNode = ComplexListNode(2)
    let C : ComplexListNode = ComplexListNode(3)
    let D : ComplexListNode = ComplexListNode(4)
    let E : ComplexListNode = ComplexListNode(5)
    //构建复杂链表
    A.m_pNext = B
    B.m_pNext = C
    C.m_pNext = D
    D.m_pNext = E
    
    A.m_psibing = C
    D.m_psibing = B
    B.m_psibing = E
    //调用方法一
//    let cloneHead = cloneNodes(pHead: A)
    //调用方法二
    cloneNodesOnly(pHead: A)
    connetsiblingNodes(phead: A)
    let cloneHead = reconnectNodes(pHead: A)
    
    
    print("cloneHead = \(cloneHead!.m_nValue)")
}

//方法一：利用哈希表，保存(A，A'),(B,B'),利用空间换取计算复杂度O(n)
fileprivate func cloneNodes(pHead: ComplexListNode?) -> ComplexListNode? {
    guard let head = pHead else {
        return nil
    }
    //第一步 先复制一个链表m_Pnext
    var NewHead = ComplexListNode(0)
    let cloneHead = NewHead
    var oldHead : ComplexListNode? = head
    var dicNode : [ComplexListNode: ComplexListNode] = [:]
    while oldHead != nil {
        let tempNode = ComplexListNode(oldHead!.m_nValue)
        dicNode[oldHead!] = tempNode
        NewHead.m_pNext = tempNode
        oldHead = oldHead?.m_pNext
        NewHead = tempNode
    }
    print(Unmanaged.passUnretained(cloneHead))
    //利用空间换取复杂度o(n)，
    var oleHead1 = pHead
    while oleHead1 != nil {
        if oleHead1?.m_psibing != nil {
            let cloneNode = dicNode[oleHead1!]
            cloneNode?.m_psibing = dicNode[oleHead1!.m_psibing!]
        }
        oleHead1 = oleHead1?.m_pNext
    }
    
    return cloneHead.m_pNext
}

//方法二：不利用开辟新空间的方式

fileprivate func cloneNodesOnly(pHead:ComplexListNode?) ->Void{
    var newHead = pHead
    while newHead != nil {
        //clone一个新节点
        let pCloneNode = ComplexListNode(newHead!.m_nValue)
        //获取下一个节点
        let nextNode = newHead?.m_pNext
        //将下一个节点，作为新接的的下一个节点
        pCloneNode.m_pNext = nextNode
        //将clone的节点，赋给下一个节点
        newHead?.m_pNext = pCloneNode
        //
        newHead = nextNode
    }
    
}

fileprivate func connetsiblingNodes(phead:ComplexListNode?)->Void{
    var pNode = phead
    while pNode != nil {
        let pcloned = pNode?.m_pNext
        if pNode?.m_psibing != nil {
            pcloned?.m_psibing = pNode?.m_psibing?.m_pNext
        }
        pNode = pcloned?.m_pNext
    }
}

fileprivate func reconnectNodes(pHead: ComplexListNode?) ->ComplexListNode?{
    var pNode = pHead
    var pCloneHead : ComplexListNode? = nil
    var pCloneNode : ComplexListNode? = nil
    if pNode != nil {
        pCloneNode = pNode?.m_pNext
        pCloneHead = pCloneNode
        pNode = pNode?.m_pNext
    }
    
    while pNode != nil {
        pCloneNode?.m_pNext = pNode?.m_pNext
        pCloneNode = pCloneNode?.m_pNext
        pNode = pNode?.m_pNext
    }
    return pCloneHead
}
