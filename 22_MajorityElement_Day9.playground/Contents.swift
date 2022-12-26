//MARK: - Majority Element

// Link: https://leetcode.com/problems/majority-element/
// Given an array nums of size n, return the majority element.
// The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.


//MARK: - Approach

//1. Maintain a result and counter variable initialized to '0'.
//2. Iterate through the given array. For each number,
    //2.1 When count is '0', assign the number to result
    //2.2 Increment the counter when result and number are same. Decrement it when not equal
//3. Return result


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var result = 0, count = 0
        for num in nums {
            if count == 0 {
                result = num
            }
            count = result == num ? count + 1 : count - 1
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [3,2,3]
solution.majorityElement(input1) // 3

//2.
var input2 = [2,2,1,1,1,2,2]
solution.majorityElement(input2) // 2

//3.
var input3 = [2,2,1,1,3,2,2]
solution.majorityElement(input3) // 2

//4.
var input4: [Int] = []
solution.majorityElement(input4) // 0
