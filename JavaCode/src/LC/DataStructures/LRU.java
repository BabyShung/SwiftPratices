package LC.DataStructures;

/**
 * Created by haozheng on 2/3/17.
 */
class Node {
    Node prev;
    Node next;
    int key;
    int val;
    public Node(int key, int val) {
        this.key = key;
        this.val = val;
        this.prev = null;
        this.next = null;
    }
}

public class LRU {

    Node head;
    Node tail;
    HashMap<Integer, Node> hash;
    int capacity;

    // @param capacity, an integer
    public LRU(int capacity) {
        // write your code here
        head = new Node(-1, -1);
        tail = new Node(-1, -1);
        hash = new HashMap<>();
        this.capacity = capacity;
        head.next = tail;
        tail.prev = head;
    }

    // @return an integer
    public int get(int key) {
        // write your code here
        Node cur = hash.get(key);
        if (cur == null) {
            return -1;
        }

        //return val and move to tail
        cur.prev.next = cur.next;
        cur.next.prev = cur.prev;
        moveToTail(cur);
        return cur.val;
    }

    // @param key, an integer
    // @param value, an integer
    // @return nothing
    public void set(int key, int value) {
        // write your code here
        if (get(key) != -1) {
            hash.get(key).val = value;
            return;
        }

        if (hash.size() == capacity) {
            //remove first
            hash.remove(head.next.key);
            head.next = head.next.next;
            head.next.prev = head;
        }

        Node node = new Node(key, value);
        hash.put(key, node);
        moveToTail(node);
    }

    private void moveToTail(Node cur) {
        cur.next = tail;
        cur.prev = tail.prev;
        tail.prev = cur;
        cur.prev.next = cur;
    }
}