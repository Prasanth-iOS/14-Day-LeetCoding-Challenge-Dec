//MARK: - Reverse Bits

// Link: https://leetcode.com/problems/reverse-bits/
// Reverse bits of a given 32 bits unsigned integer.


//MARK: - Approach

//1. Maintain a result variable initialized to '0'.
//2. Iterate through the bits of 'n'(32-bits here).
//3. Right shift 'n' and left shift 'result' for each iteration, if the last bit of 'n' is 1, then add '1' to 'result'. This will ensure the result will be reverse of 'n' as we are appending in opposite direction.
//3. Return result.


//MARK: - Complexity

//- Time complexity:
// O(log n)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var num = n
        var result = 0
        for _ in 1...32 {
            result <<= 1
            if (num & 1) == 1 {
                result += 1
            }
            num >>= 1
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = 43261596 // 00000010100101000001111010011100
solution.reverseBits(input1) // 964176192 (00111001011110000010100101000000)

//2.
var input2 = 4294967293 // 11111111111111111111111111111101
solution.reverseBits(input2) // 3221225471 (10111111111111111111111111111111)

//3.
var input3 = 0 // 0000000000000000
solution.reverseBits(input3) // 0 (0000000000000000)

//4.
var input4 = 1 // 0000000000000001
solution.reverseBits(input4) // 2147483648 (1000000000000000)
