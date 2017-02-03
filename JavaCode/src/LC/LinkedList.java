package LC;

/**
 * Created by haozheng on 2/3/17.
 */
public class LinkedList {

    //http://www.jiuzhang.com/solutions/copy-list-with-random-pointer/
    public RandomListNode copyRandomList(RandomListNode head) {
        // write your code here
        if (head == null) {
            return head;
        }
        HashMap<RandomListNode, RandomListNode> hash = new HashMap<>();

        RandomListNode dummy = new RandomListNode(-1);
        dummy.next = head;
        RandomListNode cur = head, prev = dummy;

        //copy
        while (cur != null) {
            RandomListNode copy = new RandomListNode(cur.label);
            hash.put(cur, copy);
            cur = cur.next;

            prev.next = copy;
            prev = copy;
        }

        //set random
        cur = head;
        while (cur != null) {
            RandomListNode copy = hash.get(cur);
            RandomListNode copyFromRandom = hash.get(cur.random);
            copy.random = copyFromRandom;
            cur = cur.next;
        }
        return hash.get(head);
    }

    //http://www.lintcode.com/en/problem/rotate-list/
    private int getLength(ListNode head) {
        int length = 0;
        while (head != null) {
            length ++;
            head = head.next;
        }
        return length;
    }

    public ListNode rotateRight(ListNode head, int n) {
        if (head == null) {
            return null;
        }

        int length = getLength(head);
        n = n % length;

        ListNode dummy = new ListNode(0);
        dummy.next = head;
        head = dummy;

        ListNode tail = dummy;
        for (int i = 0; i < n; i++) {
            head = head.next;
        }

        while (head.next != null) {
            tail = tail.next;
            head = head.next;
        }

        head.next = dummy.next;
        dummy.next = tail.next;
        tail.next = null;
        return dummy.next;
    }

    //http://www.lintcode.com/en/problem/insert-into-a-cyclic-sorted-list/
    public ListNode insert(ListNode node, int x) {
        // Write your code here
        if (node == null) {
            node = new ListNode(x);
            node.next = node;
            return node;
        }

        ListNode p = node;
        ListNode prev = null;
        do {
            prev = p;
            p = p.next;
            if (x <= p.val && x >= prev.val) {
                break;
            }
            if ((prev.val > p.val) && (x < p.val || x > prev.val)) {
                break;
            }
        } while (p != node);

        ListNode newNode = new ListNode(x);
        newNode.next = p;
        prev.next = newNode;
        return newNode;
    }

    //http://www.lintcode.com/en/problem/merge-two-sorted-lists/
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        // write your code here
        ListNode head = new ListNode(-1);
        ListNode current = head;
        while (l1 != null && l2 != null) {
            if (l1.val <= l2.val) {
                current.next = l1;
                l1 = l1.next;
            } else {
                current.next = l2;
                l2 = l2.next;
            }
            current = current.next;
        }
        if (l1 == null) {
            current.next = l2;
        } else {
            current.next = l1;
        }
        return head.next;
    }

    //http://www.lintcode.com/en/problem/sort-list/
    private ListNode findMiddle(ListNode head) {
        ListNode slow = head, fast = head.next;
        while (fast != null && fast.next != null) {
            fast = fast.next.next;
            slow = slow.next;
        }
        return slow;
    }

    private ListNode merge(ListNode head1, ListNode head2) {
        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;
        while (head1 != null && head2 != null) {
            if (head1.val < head2.val) {
                tail.next = head1;
                head1 = head1.next;
            } else {
                tail.next = head2;
                head2 = head2.next;
            }
            tail = tail.next;
        }
        if (head1 != null) {
            tail.next = head1;
        } else {
            tail.next = head2;
        }

        return dummy.next;
    }

    public ListNode sortList(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }

        ListNode mid = findMiddle(head);

        ListNode right = sortList(mid.next);
        mid.next = null;
        ListNode left = sortList(head);

        return merge(left, right);
    }
}
