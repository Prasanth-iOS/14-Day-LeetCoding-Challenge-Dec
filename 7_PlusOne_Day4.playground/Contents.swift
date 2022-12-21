//MARK: - Plus One

// Link: https://leetcode.com/problems/plus-one/
// You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.


//MARK: - Approach

//1. Iterate from the last index element to the first
//2. For each value,
    //2.1 if value < 9, increment the value by 1 and return the result immediately
    //2.2 else, assign '0' as the current value for the element
//3. Insert 1 at 0th index and return the result


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var index = digits.count - 1
        
        while index >= 0 {
            if digits[index] < 9 {
                digits[index] += 1
                return digits
            }
            digits[index] = 0
            index -= 1
        }
        digits.insert(1, at: 0)
        return digits
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [9]
print(solution.plusOne(input1)) // [1, 0]

//2.
var input2 = [4,3,2,1]
print(solution.plusOne(input2)) // [4, 3, 2, 2]

//3.
var input3 = [1,2,3]
print(solution.plusOne(input3)) // [1, 2, 4]

//4.
var input4 = [9,9,9,9,9]
print(solution.plusOne(input4)) // [1, 0, 0, 0, 0, 0]

//5.
var input5 = [8]
print(solution.plusOne(input5)) // [9]

//6.
var input6 = [1,0]
print(solution.plusOne(input6)) // [1, 1]
