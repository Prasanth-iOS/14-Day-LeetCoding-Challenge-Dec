//MARK: - Happy Number

// Link: https://leetcode.com/problems/happy-number/
// Write an algorithm to determine if a number n is happy.
// A happy number is a number defined by the following process:
// Starting with any positive integer, replace the number by the sum of the squares of its digits.
// Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
// Those numbers for which this process ends in 1 are happy.
// Return true if n is a happy number, and false if not.


//MARK: - Approach

//1. Maintain a set variable to track the visited numbers.
//2. Iterate while the number is not visited, then tag the number as visited and assign the number the sum of its square.
//3. The loop would complete once the number is already visited, and retrun true if it is '1', else false.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var visit = Set<Int>()
        var num = n
        while !visit.contains(num) {
            visit.insert(num)
            num = sumOfSquares(num)
        }
        return num == 1
    }

    private func sumOfSquares(_ n: Int) -> Int {
        var num = n, sum = 0
        while num > 0 {
            let remainder = num % 10
            sum += remainder * remainder
            num = num / 10
        }
        return sum
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = 19
solution.isHappy(input1) // true

//2.
var input2 = 2
solution.isHappy(input2) // false

//3.
var input3 = 1
solution.isHappy(input3) // true
