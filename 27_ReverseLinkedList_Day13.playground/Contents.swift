//MARK: - Reverse Linked List

// Link: https://leetcode.com/problems/reverse-linked-list/
// Given the head of a singly linked list, reverse the list, and return the reversed list.


//MARK: - Approach

//1. Maintain a previous node variable initialized to 'nil'.
//2. Iterate until head is nil(indication the end of list).
//3. Capture head's next node, and assign head's next to previous node.
//4. Now, assign previous node as head and head as next node.
//5. Return Previous node.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(n)


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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var previousNode: ListNode?
        while head != nil {
            let nextNode = head!.next
            head!.next = previousNode
            previousNode = head
            head = nextNode
        }
        return previousNode
    }

    func reverseListRecursion(_ head: ListNode?) -> ListNode? {
        guard let head = head, let next = head.next else {
            return head
        }
        
        let node = reverseListRecursion(next)
        
        next.next = head
        head.next = nil
        
        return node
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. [1,2,3,4,5]
let head1 = ListNode(1)
let node1_1 = ListNode(2)
let node1_2 = ListNode(3)
let node1_3 = ListNode(4)
let node1_4 = ListNode(5)

head1.next = node1_1
node1_1.next = node1_2
node1_2.next = node1_3
node1_3.next = node1_4

solution.reverseList(head1) // [5,4,3,2,1]


//2. [1,2]
let head2 = ListNode(1)
let node2_1 = ListNode(2)

head2.next = node2_1
solution.reverseList(head2) // [2,1]


//3. []
solution.reverseList(nil) // nil
