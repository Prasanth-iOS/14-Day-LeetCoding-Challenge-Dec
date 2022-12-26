//MARK: - Missing Ranges

// Link: https://leetcode.com/problems/missing-ranges/
// Given aa sorted integer array nums, where the range of elements are in the inclusive range[lower, upper], return its missing ranges.


//MARK: - Approach

//1. Maintain a result array, Iterate through the nums array one at a time and assign lower value to the current num + 1 at the end of each iteration
    //1.1 if the difference of nums[i] and lower value is '1', append lower value to result
    //1.2 else, append <lower value> -> <nums[i]-1> to result
//2. Once the loop completes, check for the upper value,
    //2.1 if lower value < upper,append <lower value> -> <upper value> to result
    //2.2 else if lower == upper, append lower value to result
//3. Return result


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

// Definition for a binary tree node.

class Solution {
    func findMissingRanges(_ nums: [Int], lower: Int, upper: Int) -> [String] {
        var ranges = [String]()
        var lowerVal = lower
        for i in 0..<nums.count {
            if lowerVal < nums[i] {
                if nums[i] - lowerVal == 1 {
                    ranges.append("\(lowerVal)")
                } else {
                    ranges.append("\(lowerVal)->\(nums[i] - 1)")
                }
            }
            lowerVal = nums[i] + 1
        }
        if lowerVal < upper {
            ranges.append("\(lowerVal)->\(upper)")
        } else if lowerVal == upper {
            ranges.append("\(lowerVal)")
        }
        return ranges
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [0,1,3,50,75]
solution.findMissingRanges(input1, lower: 0, upper: 99) // ["2", "4->49", "51->74", "76->99"]

//2.
solution.findMissingRanges(input1, lower: 0, upper: 75) // ["2", "4->49", "51->74"]

//3.
var input2 = [0,1,3,50,74]
solution.findMissingRanges(input2, lower: 0, upper: 75) // ["2", "4->49", "51->74", "75"]

//4.
var input3: [Int] = []
solution.findMissingRanges(input3, lower: 0, upper: 75) // ["0->75"]
