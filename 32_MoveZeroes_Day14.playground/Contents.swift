//MARK: - Move Zeroes

// Link: https://leetcode.com/problems/move-zeroes/
// Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.


//MARK: - Approach

//1. Maintain a index initialized to zero, iterate through the nums array for nonzero values, assign it at the index, and increment it.
//2. Now all the nonzero values came to the front of the array, so iterate through the rest of elements until nums length and assign '0'.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var nonZeroIndex = 0
        
        for num in nums where num != 0 {
            nums[nonZeroIndex] = num
            nonZeroIndex += 1
        }
        
        while nonZeroIndex < nums.count {
            nums[nonZeroIndex] = 0
            nonZeroIndex += 1
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = [0,1,0,3,12]
solution.moveZeroes(&input1) // [1,3,12,0,0]

//2.
var input2 = [0]
solution.moveZeroes(&input2) // [0]

//3.
var input3 = [1,2]
solution.moveZeroes(&input3) // [1,2]
