//MARK: - Sqrt(x)

// Link: https://leetcode.com/problems/sqrtx/
// Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
// You must not use any built-in exponent function or operator.


//MARK: - Approach

//1. Apply Binary Search, keep the left pointer start at '0' and right pointer to half of x as its square can't definitely be greater than x.
//2. Find the mid between left and right pointers, and trying squaring it to get x.
    //2.1 if mid < x, increment left by 1
    //2.2 else, decrement right by 1


//MARK: - Complexity

//- Time complexity:
// O(logn)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x >= 0 else {
            return 0
        }
        var left = 0
        var right = x / 2 + 1

        while left <= right {
            let mid = left + (right - left) / 2
            let square = mid * mid

            if square == x {
                return mid
            } else if square < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return right
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = 4
print("Square Root of \(input1) is \(solution.mySqrt(input1))\n") // 2

//2.
var input2 = 8
print("Square Root of \(input2) is \(solution.mySqrt(input2))\n") // 2

//3.
var input3 = 256
print("Square Root of \(input3) is \(solution.mySqrt(input3))\n") // 16

//4.
var input4 = 0
print("Square Root of \(input4) is \(solution.mySqrt(input4))\n") // 0
