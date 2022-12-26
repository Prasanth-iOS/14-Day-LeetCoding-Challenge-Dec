//MARK: - Intersection of Two Linked Lists

// Link: https://leetcode.com/problems/intersection-of-two-linked-lists/
// Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.


//MARK: - Approach

//1. Maintain two pointers nodeA and nodeB initialized at the head of A and B, respectively. Then let them both traverse through the lists, one node at a time.
//2. When nodeA reaches the end of a list, then redirect it to the head of B. Similarly, when nodeA reaches the end of a list, redirect it the head of A. (this will ensure the shorter list would finish traversing early and move to the same pointer of longer list as shorter list head)
//3. If at any point nodeA meets nodeB, then nodeA/nodeB is the intersection node.


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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var nodeA = headA, nodeB = headB

        while nodeA !== nodeB {
            nodeA = nodeA != nil ? nodeA?.next : headB
            nodeB = nodeB != nil ? nodeB?.next : headA
        }
        return nodeA
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1. [4,1,8,4,5], [5,6,1,8,4,5]
let head1 = ListNode(4)
let node1_1 = ListNode(1)
let node1_2 = ListNode(8)
let node1_3 = ListNode(4)
let node1_4 = ListNode(5)

head1.next = node1_1
node1_1.next = node1_2
node1_2.next = node1_3
node1_3.next = node1_4

let head2 = ListNode(5)
let node2_1 = ListNode(6)
let node2_2 = ListNode(1)

head2.next = node2_1
node2_1.next = node2_2
node2_2.next = node1_2 // intersection

solution.getIntersectionNode(head1, head2) // 8


//2. [1,9,1,2,4], [3,2,4]
let head3 = ListNode(1)
let node3_1 = ListNode(9)
let node3_2 = ListNode(1)
let node3_3 = ListNode(2)
let node3_4 = ListNode(4)

head3.next = node3_1
node3_1.next = node3_2
node3_2.next = node3_3
node3_3.next = node3_4

let head4 = ListNode(3)
head4.next = node3_3 // intersection

solution.getIntersectionNode(head3, head4) // 2


//3. [4,1,8,4,5], [3]
solution.getIntersectionNode(head1, head4) // nil


//4.
solution.getIntersectionNode(nil, nil) // nil

