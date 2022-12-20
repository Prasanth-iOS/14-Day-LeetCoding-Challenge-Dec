//MARK: - Roman to Integer
// Link: https://leetcode.com/problems/roman-to-integer/
// Problem Statement: Given a roman numeral, convert it to an integer.


//MARK: - Intuition
//start from small place value digit.
//add or sub next larger place value digit Roman equivalent by comparing the previous one

//MARK: - Approach
//1. Reverse the string, initialise result to 0.
//2. Check the Int equivalent of current Roman letter with previous one,
  //2.1. if current one is smaller, then subtract it to the result
  //2.2. else, add it to the result
//3. Return result


//MARK: - Complexity
//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)

//MARK: - Code
func romanToInt(_ s: String) -> Int {
    var result = 0
    let romanDict = getRomanDictionary()
    let reversedString = [Character](s.reversed())
    
    for i in 0..<reversedString.count {
        guard let currentValue = romanDict[String(reversedString[i])] else {
            return result
        }
        if i > 0 && currentValue < romanDict[String(reversedString[i-1])]! {
            result -= currentValue
        }
        else {
            result += currentValue
        }
    }
    return result
}

private func getRomanDictionary() -> [String: Int] {
    var dict = [String: Int]()
    dict["I"] = 1
    dict["V"] = 5
    dict["X"] = 10
    dict["L"] = 50
    dict["C"] = 100
    dict["D"] = 500
    dict["M"] = 1000
    return dict
}



//MARK: - Testing Sample Data
//1.
let input1 = "III"
print("\(input1) -> \(romanToInt(input1))")

//2.
let input2 = "LVIII"
print("\(input2) -> \(romanToInt(input2))")

//3.
let input3 = "MCMXCIV"
print("\(input3) -> \(romanToInt(input3))")
