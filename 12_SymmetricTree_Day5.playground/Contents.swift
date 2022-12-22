//MARK: - Symmetric Tree

// Link: https://leetcode.com/problems/symmetric-tree/
// Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).


//MARK: - Approach

//1. Accept two child nodes as inputs
//2. Compare the values of both nodes,
    //2.1 if both are nil, return true
    //2.2 if any one is nil or values between them don't match, return false
    //2.3 if both value matches, follow from step 1 again by passing the child nodes which need to be Symmetric


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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return isMirror(node1: root.left, node2: root.right)
    }

    private func isMirror(node1: TreeNode?, node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil {
            return true
        }
        guard let node1 = node1, let node2 = node2, node1.val == node2.val else {
            return false
        }
        return isMirror(node1: node1.left, node2: node2.right)
        && isMirror(node1: node1.right, node2: node2.left)
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1. [1,2,2,3,4,4,3]
var input1 = TreeNode(1,
                      TreeNode(2,
                               TreeNode(3), TreeNode(4)), TreeNode(2,
                                                                   TreeNode(4), TreeNode(3)))
solution.isSymmetric(input1) // true

//2. [1,2,2,3,4,3,4]
var input2 = TreeNode(1,
                      TreeNode(2,
                               TreeNode(3), TreeNode(4)), TreeNode(2,
                                                                   TreeNode(3), TreeNode(4)))
solution.isSymmetric(input2) // false

//3.
var input3 = TreeNode(1)
solution.isSymmetric(input3) // true

//4.
var input4: TreeNode? = nil
solution.isSymmetric(input4) // true

//5. [1,2,2,null,3,null,3]
var input5 = TreeNode(1,
                      TreeNode(2,
                               nil, TreeNode(3)), TreeNode(2,
                                                           nil, TreeNode(3)))
solution.isSymmetric(input5) // false
