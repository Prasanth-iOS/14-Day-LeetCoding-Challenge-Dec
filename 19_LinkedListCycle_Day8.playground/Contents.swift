//MARK: - Linked List Cycle

// Link: https://leetcode.com/problems/linked-list-cycle/
// Given head, the head of a linked list, determine if the linked list has a cycle in it.


//MARK: - Approach

//1. Using Floyd's Cycle Detection Algorithm, a.k.a Tortoise and Hare,
    //1.1. have a slow pointer which move to next node for each iteration
    //1.2. have a fast pointer which move to next to next for each iteration
//2. Iterate until fast pointer hits nil, if the node at slow and fast pointers are equal at any iteration, return true
//3. When the loop completes, return false


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
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slowNode = head, fastNode = head
        while fastNode != nil && fastNode?.next != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next

            if slowNode === fastNode {
                return true
            }
        }
        return false
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. [3,2,0,-4]
let head1 = ListNode(3)
let node2 = ListNode(2)
let node3 = ListNode(0)
let node4 = ListNode(-4)
head1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2

solution.hasCycle(head1) // true


//2. [1,2]
let head2 = ListNode(1)
let node2_1 = ListNode(2)
head2.next = node2_1
node2_1.next = head2

solution.hasCycle(head2) // true


//3.
var head3 = ListNode(1)
solution.hasCycle(head3) // false


//4.
var head4: ListNode? = nil
solution.hasCycle(head4) // false

