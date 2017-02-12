package LC.Strings;

/**
 * Created by haozheng on 2/12/17.
 */
public class reverseWords {

    //https://leetcode.com/problems/reverse-words-in-a-string-ii/
    //In place
    public void reverseWords(char[] s) {
        reverse(s, 0, s.length - 1);// reverse the whole
        int last, cur = 0;
        while (cur < s.length) {
            if (s[cur] != ' ') {
                last = cur;
                while (cur < s.length && s[cur] != ' ') {
                    cur++;
                }
                reverse(s, last, cur - 1);
            } else {
                cur++;
            }
        }
    }

    private void reverse(char[] a, int s, int e) {
        for (int i = 0; i < (e - s + 1) / 2; i++) {
            swap(a, s + i, e - i);
        }
    }

    private void swap(char[] a, int i, int j) {
        char tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }
}
