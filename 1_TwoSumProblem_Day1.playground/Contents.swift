//MARK: - Two Sum

//Problem Statement: Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//Link: https://leetcode.com/problems/two-sum/


//MARK: - Intuition

//find each numbers complement to achieve the target
//return the indices if the complement value available in the Complement Dictionary, else add the number to dictionary.


//MARK: - Approach

//1. Initialise an empty dictionary to hold 'value', 'index'
//2. Loop through 'nums'
//3. Calculate 'complement' by subtracting 'number' with target
//4. Check if the 'complement' is available in dictionary,
  //4.1. If found, return 'foundIndex' and current 'index'
  //2.2. Else, add 'complement' with its index to the dictionary
//3. Return empty array if loop finished


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var complementDict = [Int: Int]()
    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let foundIndex = complementDict[complement] {
            return [foundIndex, index]
        }
        complementDict[num] = index
    }
    return []
}


//MARK: - Testing Sample Data

print(twoSum([2,7,11,15], 9)) // [0,1]
print(twoSum([3,2,4], 6)) // [1,2]
print(twoSum([3,3], 6)) // [0,1]
