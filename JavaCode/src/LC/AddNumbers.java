package LC;

/**
 * Created by haozheng on 2/4/17.
 */
public class AddNumbers {

    //Same code
    //http://www.lintcode.com/en/problem/add-binary/
    //https://leetcode.com/problems/add-strings/
//**********************************************************************
//    public String addBinary(String a, String b) {
//        return addStringsShared(a, b, 2);
//    }
//    public String addStrings(String num1, String num2) {
//        return addStringsShared(num1, num2, 10);
//    }
    public String addStringsShared(String num1, String num2, int delta) {
        int i = num1.length() - 1, j = num2.length() - 1, carry = 0;
        String res = "";
        while (i >= 0 || j >= 0) {
            if (i >= 0)
                carry += num1.charAt(i--) - '0';
            if (j >= 0)
                carry += num2.charAt(j--) - '0';
            res = (carry % delta) + res;
            carry /= delta;
        }
        return carry > 0 ? "1" + res : res;
    }
    //**********************************************************************

    //http://www.lintcode.com/en/problem/add-binary/
    private int getValue(char cur) {
        return (int)(cur - '0');
    }

    public String addBinary(String a, String b) {
        if (a == null || a.length() == 0) {
            return b;
        }
        if(b == null || b.length() == 0) {
            return a;
        }
        int i = a.length() - 1;
        int j = b.length() - 1;
        int carry = 0;
        StringBuilder res = new StringBuilder();
        while (i >= 0 && j >= 0) {
            int digit = getValue(a.charAt(i)) + getValue(b.charAt(j)) + carry;
            carry = digit / 2;
            digit %= 2;
            res.append(digit);
            i--;
            j--;
        }
        while(i >= 0) {
            int digit = getValue(a.charAt(i)) + carry;
            carry = digit / 2;
            digit %= 2;
            res.append(digit);
            i--;
        }
        while(j >= 0) {
            int digit = getValue(b.charAt(j)) + carry;
            carry = digit / 2;
            digit %= 2;
            res.append(digit);
            j--;
        }
        if(carry > 0) {
            res.append(carry);
        }
        return res.reverse().toString();
    }

    //http://www.lintcode.com/en/problem/add-two-numbers/
    public ListNode addLists(ListNode l1, ListNode l2) {
        // write your code here
        if (l1 == null && l2 == null) {
            return null;
        }
        ListNode dummy = new ListNode(-1);
        ListNode cur = dummy;
        int carry = 0;
        while(l1 != null && l2 != null) {
            int sum = l1.val + l2.val + carry;
            carry = sum / 10;
            cur.next = new ListNode(sum % 10);
            l1 = l1.next;
            l2 = l2.next;
            cur = cur.next;
        }

        while (l1 != null) {
            int sum = l1.val + carry;
            carry = sum / 10;
            cur.next = new ListNode(sum % 10);
            l1 = l1.next;
            cur = cur.next;
        }

        while (l2 != null) {
            int sum = l2.val + carry;
            carry = sum / 10;
            cur.next = new ListNode(sum % 10);
            l2 = l2.next;
            cur = cur.next;
        }

        if (carry > 0) {
            cur.next = new ListNode(carry);
        }
        return dummy.next;
    }

    //http://www.lintcode.com/en/problem/add-digits/
    public int addDigits(int num) {
        if (num == 0) {
            return 0;
        }
        int res = 0;
        while (num != 0) {
            int digit = num % 10;
            res = (res * 10 + digit) % 9;
            num /= 10;
        }
        return res == 0 ? 9 : res;
    }

    //https://leetcode.com/problems/add-strings/
    public String addStrings(String num1, String num2) {
        int i = num1.length() - 1, j = num2.length() - 1, carry = 0;
        String res = "";
        while (i >= 0 || j >= 0) {
            if (i >= 0)
                carry += num1.charAt(i--) - '0';
            if (j >= 0)
                carry += num2.charAt(j--) - '0';
            res = (carry % 10) + res;
            carry /= 10;
        }
        return carry > 0 ? "1" + res : res;
    }
}
