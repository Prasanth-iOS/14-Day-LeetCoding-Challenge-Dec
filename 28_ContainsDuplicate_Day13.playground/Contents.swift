//MARK: - Contains Duplicate

// Link: https://leetcode.com/problems/contains-duplicate/
// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.


//MARK: - Approach

//1. Initialize a Set with the nums array and validate if nums array count is greater than the set, as Set will not allow duplicate elements.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count > Set(nums).count
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [1,2,3,1]
solution.containsDuplicate(input1) // true

//2.
var input2 = [1,2,3,4]
solution.containsDuplicate(input2) // false

//3.
var input3 = [1,1,1,3,3,4,3,2,4,2]
solution.containsDuplicate(input3) // true

//4.
var input4 = [1]
solution.containsDuplicate(input4) // false
