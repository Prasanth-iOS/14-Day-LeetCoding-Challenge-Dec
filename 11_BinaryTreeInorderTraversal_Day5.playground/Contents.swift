//MARK: - Binary Tree Inorder Traversal

// Link: https://leetcode.com/problems/binary-tree-inorder-traversal/
// Given the root of a binary tree, return the inorder traversal of its nodes' values.


//MARK: - Approach

//1. Keeping a stack of visited nodes, iterate through the subsequent left childs.
//2. When there is no left child, add the last visited value from stack to result
//3. Change the current node to right child and repeat the steps above.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = [], stack: [TreeNode] = [], currNode = root
        while currNode != nil || !stack.isEmpty {
            if let node = currNode {
                stack.append(node)
                currNode = node.left
            } else {
                let prevNode = stack.removeLast()
                result.append(prevNode.val)
                currNode = prevNode.right
            }
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1. [1,null,2,3]
var input1 = TreeNode(1,
                      nil, TreeNode(2,
                                    TreeNode(3), nil))
solution.inorderTraversal(input1)

//2.
var input2: TreeNode? = nil
solution.inorderTraversal(input2) // []

//3.
var input3 = TreeNode(1)
solution.inorderTraversal(input3) // [1]
