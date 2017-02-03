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
}
