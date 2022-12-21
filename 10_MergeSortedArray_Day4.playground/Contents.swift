//MARK: - Merge Sorted Array

// Link: https://leetcode.com/problems/merge-sorted-array/
// You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
// Merge nums1 and nums2 into a single array sorted in non-decreasing order.


//MARK: - Approach

//1. Loop through and compare each value from both array from their last elements and put the larger one from the end of 1st array where space was left behind.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1
        
        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[i + j + 1] = nums1[i]
                i -= 1
            } else {
                nums1[i + j + 1] = nums2[j]
                j -= 1
            }
        }
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [1,2,3,0,0,0], input2 = [2,5,6]
solution.merge(&input1, 3, input2, 3)
print("Merged Sorted Array: \(input1)\n") // [1, 2, 2, 3, 5, 6]

//2.
var input3 = [1], input4: [Int] = []
solution.merge(&input3, 1, input4, 0)
print("Merged Sorted Array: \(input3)\n") // [1]

//3.
var input5 = [0], input6 = [1]
solution.merge(&input5, 0, input6, 1)
print("Merged Sorted Array: \(input5)\n") // [1]

//4.
var input7 = [0,0], input8 = [1,2]
solution.merge(&input7, 0, input8, 2)
print("Merged Sorted Array: \(input7)\n") // [1, 2]
