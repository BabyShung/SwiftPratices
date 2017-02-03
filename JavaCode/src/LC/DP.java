package LC;

/**
 * Created by haozheng on 2/3/17.
 */
public class DP {
    //http://www.lintcode.com/en/problem/climbing-stairs-ii/
    public int climbStairs2(int n) {
        int[] sum = new int[n < 4 ? 4 : n + 1];
        sum[0] = 1;
        sum[1] = 1;
        sum[2] = 2;
        sum[3] = 4;
        for (int i = 4; i <= n; i++) {
            sum[i] = sum[i - 1] + sum[i - 2] + sum[i - 3];
        }
        return sum[n];
    }
}
