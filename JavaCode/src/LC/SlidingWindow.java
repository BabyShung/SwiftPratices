package LC;

/**
 * Created by haozheng on 2/3/17.
 */
public class SlidingWindow {

    //http://www.lintcode.com/en/problem/window-sum/#
    public int[] winSum(int[] nums, int k) {
        // write your code here

        //needs a sum array of size = nums.length - k + 1
        //calculate sum[0]
        //loop through nums.length - k + 1 times
        //update sum array

        if (nums == null || nums.length < k || k <= 0) {
            return new int[0];
        }
        int times = nums.length - k + 1;
        int[] sum = new int[times];
        for (int i = 0; i < k; i++) {
            sum[0] += nums[i];
        }
        for (int i = 1; i < times; i++) {
            sum[i] = sum[i - 1] - nums[i - 1] + nums[i + k - 1];
        }
        return sum;
    }


}
