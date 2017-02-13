package LC.TwoPointers.Forward;

/**
 * Created by haozheng on 2/12/17.
 */
public class FindAllAnagramsInAString {
    public List<Integer> findAnagrams(String s, String p) {
        List<Integer> res = new ArrayList<>();
        if (s == null || p == null) {
            return res;
        }
        int i = 0, j = 0, pLen = p.length(), sLen = s.length();
        int count = pLen;
        HashMap<Character, Integer> hash = new HashMap<>();
        //must handle duplicated elements
        for (char cur : p.toCharArray()) {
            if (hash.containsKey(cur)) {
                hash.put(cur, hash.get(cur) + 1);
            } else {
                hash.put(cur, 1);
            }
        }
        while (j < sLen) {
            char cur = s.charAt(j);
            j++;
            if (hash.containsKey(cur)) {
                int occurance = hash.get(cur);
                if (occurance >= 1) {
                    count--;
                }
                hash.put(cur, occurance - 1);
                if (count == 0) {
                    res.add(i);
                }
            }

            char front = s.charAt(i);
            if (j - i == pLen) {
                if (hash.containsKey(front) && hash.get(front) >= 0) {
                    count++;
                    hash.put(front, hash.get(front) + 1);
                }
                i++;
            }
        }
        return res;
    }
}
