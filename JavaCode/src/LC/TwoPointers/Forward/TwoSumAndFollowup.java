package LC.TwoPointers.Forward;

/**
 * Created by haozheng on 2/14/17.
 */
public class TwoSumAndFollowup {

    //http://www.lintcode.com/en/problem/two-sum-unique-pairs/
    public int twoSum6(int[] nums, int target) {

        if (nums == null || nums.length == 0) {
            return 0;
        }
        Arrays.sort(nums);

        int start = 0, end = nums.length - 1;
        int count = 0;
        while (start < end) {
            int sum = nums[start] + nums[end];
            if (sum == target) {
                count++;
                start++;
                end--;
                while (start < end && nums[start] == nums[start - 1]) {
                    start++;
                }
                while (start < end && nums[end] == nums[end + 1]) {
                    end--;
                }
            } else if (sum > target) {
                end--;
            } else {
                start++;
            }
        }
        return count;
    }
}
