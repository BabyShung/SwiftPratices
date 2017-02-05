package LC;

/**
 * Created by haozheng on 2/4/17.
 */
public class DFS {
    //http://www.lintcode.com/en/problem/letter-combinations-of-a-phone-number/
    public ArrayList<String> letterCombinations(String digits) {
        ArrayList<String> res = new ArrayList<String>();

        if (digits == null || digits.length() == 0) {
            return res;
        }

        StringBuilder sb = new StringBuilder();//container
        helper(getNumberMap(), digits, sb, res);

        return res;
    }

    private void helper(Map<Character, char[]> map, String digits,
                        StringBuilder sb, ArrayList<String> res) {
        if (sb.length() == digits.length()) {
            res.add(sb.toString());
            return;
        }
        char start = digits.charAt(sb.length());//start from the first one
        for (char c : map.get(start)) {
            sb.append(c);
            helper(map, digits, sb, res);
            sb.deleteCharAt(sb.length() - 1);
        }
    }

    private Map<Character, char[]> getNumberMap() {
        Map<Character, char[]> map = new HashMap<Character, char[]>();
        map.put('0', new char[] {});
        map.put('1', new char[] {});
        map.put('2', new char[] { 'a', 'b', 'c' });
        map.put('3', new char[] { 'd', 'e', 'f' });
        map.put('4', new char[] { 'g', 'h', 'i' });
        map.put('5', new char[] { 'j', 'k', 'l' });
        map.put('6', new char[] { 'm', 'n', 'o' });
        map.put('7', new char[] { 'p', 'q', 'r', 's' });
        map.put('8', new char[] { 't', 'u', 'v'});
        map.put('9', new char[] { 'w', 'x', 'y', 'z' });
        return map;
    }

}
