//MARK: - Best Time to Buy and Sell Stock

// Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
// You are given an array prices where prices[i] is the price of a given stock on the ith day.
// You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
// Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.


//MARK: - Approach

//1. Keep profit as '0', buyDay as '0', sellDay as '1'
//2. Loop through until sellDay reaches total no of days given in input array and check the difference between the values of sellDay and buyDay,
    //2.1. If it is negative, assign the sellDay to buyDay (as it the day with lowest price)
    //2.2. Keep the difference as the maximum value if it is greater than existing maxProfit
//3. Return maxProfit


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        var maxProfit = 0, buyDay = 0, sellDay = 1
        while sellDay < prices.count {
            let tempProfit = prices[sellDay] - prices[buyDay]
            if  tempProfit < 0 {
                buyDay = sellDay
            }
            maxProfit = max(maxProfit, tempProfit)
            sellDay += 1
        }
        return maxProfit
    }
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
var input1 = [7,1,5,3,6,4]
solution.maxProfit(input1) // 5

//2. [1,2,2,3,4,3,4]
var input2 = [1]
solution.maxProfit(input2) // 0

//3.
var input3: [Int] = []
solution.maxProfit(input3) // 0
