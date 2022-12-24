//MARK: - Valid Palindrome

// Link: https://leetcode.com/problems/valid-palindrome/
// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
// Given a string s, return true if it is a palindrome, or false otherwise.


//MARK: - Approach

//1. Start from the left most character, check its value against right most(index which is the length of the string) counterpart.
//2. Increment left by '1' and decrement right by '-1' for each iteration
//3. Have a character extension to check if the value is a letter or a number, if not do step 2
//4. If the character on both index didn't match, return false
//5. If no issues, when the loop completes, return true


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else {
            return true
        }
        var leftIdx = s.index(s.startIndex, offsetBy: 0)
        var rightIdx = s.index(s.endIndex, offsetBy: -1)
        
        while leftIdx < rightIdx {
            while !s[leftIdx].isAlphaNumeric && leftIdx < rightIdx {
                leftIdx = s.index(leftIdx, offsetBy: 1)
            }
            while !s[rightIdx].isAlphaNumeric && leftIdx < rightIdx {
                rightIdx = s.index(rightIdx, offsetBy: -1)
            }
            
            guard s[leftIdx].lowercased() == s[rightIdx].lowercased() else {
                return false
            }
            
            guard s.formIndex(&leftIdx, offsetBy: 1, limitedBy: s.endIndex),
                    s.formIndex(&rightIdx, offsetBy: -1, limitedBy: s.startIndex) else {
                return true
            }
        }
        return true
    }
}

extension Character {
    var isAlphaNumeric: Bool {
        isLetter || isNumber
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = "A man, a plan, a canal: Panama"
solution.isPalindrome(input1) // "amanaplanacanalpanama" -> true

//2.
var input2 = "race a car"
solution.isPalindrome(input2) // "raceacar" -> false

//3.
var input3 = " "
solution.isPalindrome(input3) // true

//4.
var input4 = "a."
solution.isPalindrome(input4) // false
