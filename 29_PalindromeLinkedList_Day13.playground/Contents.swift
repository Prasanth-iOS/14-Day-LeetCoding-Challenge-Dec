//MARK: - Palindrome Linked List

// Link: https://leetcode.com/problems/palindrome-linked-list/
// Given the head of a singly linked list, return true if it is a palindrome or false otherwise.


//MARK: - Approach

//1. Find the mid point of the List and reverse first part of the list to compare it with the second part
//2. To find the mid point, have a slow pointer(increments by 1) and fast pointer(increments by 2). The mid point is the slow pointer when the fast pointer hits nil.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head, fast = head, prev: ListNode? = nil
        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next

            let next = slow!.next
            slow!.next = prev
            prev = slow
            slow = next
        }

        if fast != nil {
            slow = slow!.next
        }

        while prev != nil {
            print("Slow: \(slow!.val),  Reverse: \(prev!.val)")
            if slow!.val != prev!.val {
                return false
            }
            slow = slow!.next
            prev = prev!.next
        }
        return true
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. [1,2,2,1]
let head1 = ListNode(1)
let node1_1 = ListNode(2)
let node1_2 = ListNode(2)
let node1_3 = ListNode(1)

head1.next = node1_1
node1_1.next = node1_2
node1_2.next = node1_3

solution.isPalindrome(head1) // true


//2. [1,2]
let head2 = ListNode(1)
let node2_1 = ListNode(2)

head2.next = node2_1
solution.isPalindrome(head2) // false


//3. []
let head3 = ListNode(1)
solution.isPalindrome(head3) // true

//4. [1,2,3,2,1]
let head4 = ListNode(1)
let node4_1 = ListNode(2)
let node4_2 = ListNode(3)
let node4_3 = ListNode(2)
let node4_4 = ListNode(1)

head4.next = node4_1
node4_1.next = node4_2
node4_2.next = node4_3
node4_3.next = node4_4

solution.isPalindrome(head4) // true
