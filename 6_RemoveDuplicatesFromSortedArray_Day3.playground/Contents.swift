//MARK: - Remove Duplicates from Sorted Array
// Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
// Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.
// Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.


//MARK: - Approach
//1. Keep the current index as 0
//2. Loop through, check and add to  index+1, if the element is not same as the element in current index
//3. This will bring all the unique elements to front until the current index. Return current index + 1 at the end.


//MARK: - Complexity
//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var currentIndex = 0

        for num in nums where num != nums[currentIndex] {
            currentIndex += 1
            nums[currentIndex] = num
        }
        return currentIndex + 1
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [1,1,2]
print(solution.removeDuplicates(&input1)) // 2

//2.
var input2 = [0,0,1,1,1,2,2,3,3,4]
print(solution.removeDuplicates(&input2)) // 5

//3.
var input3 = [Int]()
print(solution.removeDuplicates(&input3)) // 1

