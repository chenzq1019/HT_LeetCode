//
//  二叉树的公共祖先.swift
//  HT_LeetCode
//
//  Created by 陈竹青 on 2020/11/25.
//

import Foundation


/**
 * 方法一 通过遍历的方式找到节点的路径，然后比较路径上的节点找到最近的公共祖先。
 * 方法二，由于是排序二叉树所以他的左子树都小于根节点，右子树都大于根节点。因此我们可以，首先访问根节点判断所查询的节点是在其左子树上还是右子树上，
 * 如果是左子树 上，则递归查询左子树。
 * 如果在右子树上，则递归查询右子树
 * 否则返回根节点，说明公共祖先是根节点
 *
 **/

func test() -> Void {
    // Do any additional setup after loading the view.
    let node1 = TreeNode(6)
    let node2 = TreeNode(2)
    let node3 = TreeNode(0)
    let node4 = TreeNode(4)
    let node5 = TreeNode(3)
    let node6 = TreeNode(5)
    let node7 = TreeNode(8)
    let node8 = TreeNode(7)
    let node9 = TreeNode(9)
    
    node1.left = node2
    node1.right = node7
    
    node2.left = node3
    node2.right = node4
    
    node4.left = node5
    node4.right = node6
    node7.left = node8
    node7.right = node9
    
    let findNode = lowestCommonAncestor1(node1, node3, node9)
    
    if let node = findNode {
        print("公共祖先是\(node.val)")
    }
}


func lowestCommonAncestor1(_ root: TreeNode?,_ p: TreeNode?,_ q: TreeNode?) -> TreeNode? {
    //方法一：
    var list : Array = [TreeNode]()
    var findNode1 : Bool = false
    travalTree(root, &list, p, &findNode1)
    var findNode2 : Bool = false
    var list1 : Array = [TreeNode]()
    travalTree(root, &list1, q, &findNode2)
    let c = list.count <= list1.count ? list.count : list1.count
    var findNode: TreeNode?
    for item in 0 ..< c {
        let tempNode1 = list[item]
        let tempNdode2 = list1[item]
        if tempNode1 === tempNdode2 {
            findNode = tempNode1
        }else {
            break
        }
    }
    return findNode

}


func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode? , _ q: TreeNode?) -> TreeNode?  {
 
    //方法二：
    if root == nil {
        return nil
    }
    if root!.val > p!.val && root!.val > q!.val {
        return lowestCommonAncestor(root?.left,p,q)
    }else if(root!.val < p!.val && root!.val < q!.val){
        return lowestCommonAncestor(root?.right,p,q)
    }else{
        return root
    }
    
}

func travalTree(_ root: TreeNode?, _ list: inout Array<TreeNode> , _ p: TreeNode? , _ find: inout Bool) -> Void {
    if root == nil {
        find = false
        return //false
    }
    list.append(root!)
    if root === p {
        find = true
        return
    }
    if find == false {
        travalTree(root?.left, &list, p, &find)
    }
    if find == false {
        travalTree(root?.right, &list, p, &find)
    }
    if find == false {
        list.remove(at:list.count-1)
    }
}
