//MARK: - Single Number

// Link: https://leetcode.com/problems/single-number/
// Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
// You must implement a solution with a linear runtime complexity and use only constant extra space.


//MARK: - Approach

//1. Use Bit Manipulation - XOR
    //1.1. Any bit XOR with '0' returns the bit. // a ^ 0 = a
    //1.2. Any bit XOR with the same bit returns '0'. // a ^ a = 0
//2. So the unique number calculation can be, (a ^ b ^ a) = (a ^ a ^ b) = (0 ^ b) = b


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [2,2,1]
solution.singleNumber(input1) // 1

//2.
var input2 = [4,1,2,1,2]
solution.singleNumber(input2) // 4

//3.
var input3 = [1]
solution.singleNumber(input3) // 1
