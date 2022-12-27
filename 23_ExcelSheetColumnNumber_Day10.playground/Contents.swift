//MARK: - Excel Sheet Column Number

// Link: https://leetcode.com/problems/excel-sheet-column-number/
// Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.


//MARK: - Approach

//1. Maintain a result variable initialized to '0'.
//2. Iterate through the given string with its Unicode Scalar value. For each character, calculate result by adding the char's numerical representation with result * 26. ((result * 26) + (charValue - 64))
//3. Return result


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var result = 0
        for char in columnTitle.unicodeScalars {
            let value = Int(char.value) - 64
            result = (result * 26)  + value
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = "A"
solution.titleToNumber(input1) // 1

//2.
var input2 = "AB"
solution.titleToNumber(input2) // 28

//3.
var input3 = "ZY"
solution.titleToNumber(input3) // 701

//4.
var input4 = ""
solution.titleToNumber(input4) // 0
