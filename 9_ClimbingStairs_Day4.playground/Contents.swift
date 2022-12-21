//MARK: - Climbing Stairs

// Link: https://leetcode.com/problems/climbing-stairs/
// You are climbing a staircase. It takes n steps to reach the top.
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?


//MARK: - Approach

//1. From the top step, the number of steps is 0
//2. And the next step below top, the number of steps required is 1. Hereafter, DP[n] = DP[n-1] + DP[n-2]
//3. Calculation using above formula for each step while looping through it will provide the final result for n steps.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n < 0 {
            return 0
        }
        if n == 0 || n == 1 {
            return 1
        }
        var prev = 0, post = 1, total = 0
        for _ in 1...n {
            total = prev + post
            prev = post
            post = total
        }
        return total
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = 2
print("Stair: \(input1), Number of Ways: \(solution.climbStairs(input1))\n") // 2

//2.
var input2 = 5
print("Stair: \(input2), Number of Ways: \(solution.climbStairs(input2))\n") // 3

//3.
var input3 = 15
print("Stair: \(input3), Number of Ways: \(solution.climbStairs(input3))\n") // 3

//4.
var input4 = 0
print("Stair: \(input4), Number of Ways: \(solution.climbStairs(input4))\n") // 0
