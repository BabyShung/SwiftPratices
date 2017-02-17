package LC;

/**
 * Created by haozheng on 2/16/17.
 */
public class PascalTriangle {
    public List<List<Integer>> generate(int numRows) {

        List<List<Integer>> res = new ArrayList<>();
        if (numRows <= 0) {
            return res;
        }

        for (int i = 0; i < numRows; i++) {
            ArrayList<Integer> cur = new ArrayList<>();
            for (int j = 0; j <= i; j++) {
                if (j == 0 || j == i) {
                    cur.add(1);
                    continue;
                }
                List<Integer> prev = res.get(i - 1);
                int num = prev.get(j - 1) + prev.get(j);
                cur.add(num);
            }
            res.add(cur);
        }
        return res;
    }
}
