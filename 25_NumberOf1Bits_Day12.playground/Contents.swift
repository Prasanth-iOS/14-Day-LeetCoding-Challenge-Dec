//MARK: - Number of 1 Bits

// Link: https://leetcode.com/problems/number-of-1-bits/
// Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).


//MARK: - Approach

//1. Maintain a count variable initialized to '0'.
//2. Iterate until 'n' becomes 0.
//3. Assign 'n' by 'AND'ing n with n - 1 for each iteration and increment the count.
//3. Return count.


//MARK: - Complexity

//- Time complexity:
// O(1)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n, count = 0
        while n > 0 {
            n &= (n - 1)
            count += 1
        }
        return count
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = 11 // 00000000000000000000000000001011
solution.reverseBits(input1) // 3

//2.
var input2 = 128 // 00000000000000000000000010000000
solution.reverseBits(input2) // 1

//3.
var input3 = 4294967293 // 11111111111111111111111111111101
solution.reverseBits(input3) // 31
