//MARK: - Maximum Depth of Binary Tree

// Link: https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
// Given the root of a binary tree, return its maximum depth.
// A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.


//MARK: - Approach

//1. Return 0 when the node is nil
//2. Using recursion, add '1' with the max value out of the child nodes passed individually


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        return max(maxDepth(node.left), maxDepth(node.right)) + 1
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1. [3,9,20,null,null,15,7]
var input1 = TreeNode(3,
                      TreeNode(9), TreeNode(20,
                                            TreeNode(15), TreeNode(7)))
solution.maxDepth(input1) // 3

//2. [1,null,2]
var input2 = TreeNode(1,
                      nil, TreeNode(2))
solution.maxDepth(input2) // 2

//3.
var input3 = TreeNode(1)
solution.maxDepth(input3) // 1

//4.
var input4: TreeNode? = nil
solution.maxDepth(input4) // 0
