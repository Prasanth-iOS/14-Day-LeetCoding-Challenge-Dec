//MARK: - Longest Common Prefix

// Problem Statement: Write a function to find the longest common prefix string amongst an array of strings.
// Link: https://leetcode.com/problems/longest-common-prefix/


//MARK: - Approach

// 1. sort given strings and initialise 'prefix' to empty string (n log n)
// 2. loop the smaller string from the first and last string
// 3. compare both by each character
    // 3.1 if equal, append the character to 'prefix'
    // 3.2 else, return 'prefix'
// 4. when the loop completes, return 'prefix'


//MARK: - Complexity

//- Time complexity:
// O(n log n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        guard strs.count > 1 else {
            return strs.first ?? ""
        }
        var sortedStrings = strs.sorted() // O(n log n)

        var prefix = ""
        var smallerString: [Character], largerString: [Character] = []
        if sortedStrings[0].count < sortedStrings[strs.count - 1].count {
            smallerString = Array(sortedStrings[0])
            largerString = Array(sortedStrings[strs.count - 1])
        } else {
            smallerString = Array(sortedStrings[strs.count - 1])
            largerString = Array(sortedStrings[0])
        }
        
        for (i, char) in smallerString.enumerated() {
            if char == largerString[i] {
                prefix.append(char)
            } else {
                return prefix
            }
        }
        return prefix
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
print(solution.longestCommonPrefix([])) // ""
print(solution.longestCommonPrefix(["flower","flow","flight"])) // "fl"
print(solution.longestCommonPrefix(["dog","racecar","car"])) // ""
