//MARK: - Missing Number

// Link: https://leetcode.com/problems/missing-number/
// Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.


//MARK: - Approach

//1. Maintain a sum variable initialized to zero
//2. Iterate through nums array and add each number to the sum.
//3. Calculate the total sum with total count of the nums array using formula (n * (n - 1) / 2).
//4. Return the difference of total sum and sum of nums array.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var sumArr = 0
        for num in nums {
            sumArr += num
        }
        let n = nums.count
        let sumAll = n * (n + 1) / 2
        return sumAll - sumArr
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
let input1 = [3,0,1]
solution.missingNumber(input1) // 2

//2.
let input2 = [0,1]
solution.missingNumber(input2) // 2

//3.
let input3 = [9,6,4,2,3,5,7,0,1]
solution.missingNumber(input3) // 8
