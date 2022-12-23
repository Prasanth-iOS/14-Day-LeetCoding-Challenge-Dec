//MARK: - Pascal's Triangle

// Link: https://leetcode.com/problems/pascals-triangle/
// Given an integer numRows, return the first numRows of Pascal's triangle.


//MARK: - Approach

//1. Assign '1' for first row
//2. Loop through the other rows having the first and last element manually set to '1', calculate other elements with the sum of previous row's currrent index and current index - 1.
//3. Return the result


//MARK: - Complexity

//- Time complexity:
// O(n^2)
//
//- Space complexity:
// O(n^2)


//MARK: - Code

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {
            return [[]]
        }
        var result: [[Int]] = [[1]]
        var rowIdx = 1
        while rowIdx < numRows {
            let prevRow = result[rowIdx - 1]
            var rowArray: [Int] = [1]
            var leftIdx = 1
            while leftIdx < rowIdx {
                rowArray.append(prevRow[leftIdx - 1] + prevRow[leftIdx])
                leftIdx += 1
            }
            rowArray.append(1)
            result.append(rowArray)
            rowIdx += 1
        }
        return result
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = 5
solution.generate(input1) // [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]

//2.
var input2 = 1
solution.generate(input2) // [[1]]

//3.
var input3 = 0
solution.generate(input3) // [[]]
