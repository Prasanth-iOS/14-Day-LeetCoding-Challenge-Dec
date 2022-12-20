//MARK: - Valid Parentheses
// Link: https://leetcode.com/problems/valid-parentheses/
// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.


//MARK: - Intuition
//Check if the closing parentheses corresponds to the right one using stack


//MARK: - Approach
//1. For every character in the string,
  //1.1. if open parentheses, add to stack
  //1.2. else, check the character against the pop last element in stack and return false if not matched
//2. Return stack.isEmpty


//MARK: - Complexity
//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        for char in s {
            if char == "{" || char == "[" || char == "(" {
                stack.append(char)
            } else if char == "}" {
                guard let val = stack.popLast(), val == "{" else { return false }
            } else if char == "]" {
                guard let val = stack.popLast(), val == "[" else { return false }
            } else if char == ")" {
                guard let val = stack.popLast(), val == "(" else { return false }
            }
        }
        return stack.isEmpty
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
let input1 = ""
print("\(input1) -> \(solution.isValid(input1))") // true

//2.
let input2 = "("
print("\(input2) -> \(solution.isValid(input2))") // false

//3.
let input3 = "()"
print("\(input3) -> \(solution.isValid(input3))") // true

//3.
let input4 = "{{[]}"
print("\(input4) -> \(solution.isValid(input4))") // false

//4.
let input5 = "{{[]}}"
print("\(input5) -> \(solution.isValid(input5))") // true
