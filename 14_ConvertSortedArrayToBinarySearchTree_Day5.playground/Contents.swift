//MARK: - Convert Sorted Array to Binary Search Tree

// Link: https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
// Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.


//MARK: - Approach

//1. Have a recursive function to accept the left and right index
//2. Find the mid index, access the value in the index and create a Node with the value
//3. Assign the left and right childs by the recursive function with values as mid - 1 and mid + 1 respectively
//4. Return the node


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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        sortedArrayToBST(nums, leftIdx: 0, rightIdx: nums.count - 1)
    }

    private func sortedArrayToBST(_ nums: [Int], leftIdx: Int, rightIdx: Int) -> TreeNode? {
        guard leftIdx <= rightIdx else {
            return nil
        }
        let mid = leftIdx + (rightIdx - leftIdx) / 2
        var node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(nums, leftIdx: leftIdx, rightIdx: mid - 1)
        node.right = sortedArrayToBST(nums, leftIdx: mid + 1, rightIdx: rightIdx)
        return node
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1. [1,2,2,3,4,4,3]
var input1 = [-10,-3,0,5,9]
solution.sortedArrayToBST(input1) // [0,-3,9,-10,null,5]

//2. [1,2,2,3,4,3,4]
var input2 = [1,3]
solution.sortedArrayToBST(input2) // [3,1]

//3.
var input3: [Int] = []
solution.sortedArrayToBST(input3) // nil
