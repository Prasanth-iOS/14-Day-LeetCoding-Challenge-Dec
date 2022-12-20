//MARK: - Merge Two Sorted Lists
// Link: https://leetcode.com/problems/merge-two-sorted-lists/
// You are given the heads of two sorted linked lists list1 and list2.
// Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.
// Return the head of the merged linked list.


//MARK: - Approach
//1. Compare both lists and add the smaller one to 'dummyNode'
//2. Return 'dummyNode'


//MARK: - Complexity
//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummyNode = ListNode(0)
        var currentDummyNode = dummyNode
        var l1 = list1
        var l2 = list2

        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                currentDummyNode.next = l1
                l1 = l1?.next
            } else {
                currentDummyNode.next = l2
                l2 = l2?.next
            }
            currentDummyNode = currentDummyNode.next!
        }

        currentDummyNode.next = l1 ?? l2
        return dummyNode.next
    }
}


func printListNodes(_ listNode: ListNode?) {
    var currNode = listNode
    print("Merged List-------------")
    while currNode != nil {
        print(currNode!.val)
        currNode = currNode?.next
    }
    print("\n\n")
}


//MARK: - Testing Sample Data

let solution = Solution()
//1.
let list1 = ListNode(1,
                      ListNode(2,
                               ListNode(4)))
let list2 = ListNode(1,
                     ListNode(3,
                              ListNode(4)))
printListNodes(solution.mergeTwoLists(list1, list2)) // 1,1,2,3,4,4

//2.
let list3: ListNode? = nil
let list4: ListNode? = nil
printListNodes(solution.mergeTwoLists(list3, list4)) // nil

//3.
let list5: ListNode? = nil
let list6: ListNode? = ListNode(0)
printListNodes(solution.mergeTwoLists(list5, list6)) // 0

