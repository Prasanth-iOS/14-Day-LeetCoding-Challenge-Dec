//MARK: - Valid Anagram

// Link: https://leetcode.com/problems/valid-anagram/
// Given two strings s and t, return true if t is an anagram of s, and false otherwise.


//MARK: - Approach

//1. Maintain a dictionary and count the number of occurences of each character in the first string.
//2. Iterate through the second string and decrease the number of occurences of each charcter when match found, else return false.
//3. At any point, when the count of a character in the map is '1' set it to nil(just to remove the element from dictionary).
//4. Return true if dictionary is empty, else false.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


//MARK: - Code

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var map: [Character : Int] = [:]
        for c in s {
            map[c, default: 0] += 1
        }
        
        for c in t {
            guard let count = map[c] else {
                return false
            }
            map[c] = count == 1 ? nil : count - 1
        }
        return map.isEmpty
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
solution.isAnagram("anagram", "nagaram") // true

//2.
solution.isAnagram("rat", "car") // false

//1.
solution.isAnagram("a", "a") // true
