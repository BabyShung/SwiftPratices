package LC.TwoPointers.Forward;

/**
 * Created by haozheng on 2/15/17.
 */
public class ThreeSum {
    public ArrayList<ArrayList<Integer>> threeSum(int[] nums) {

        ArrayList<ArrayList<Integer>> res = new ArrayList<>();
        if (nums == null || nums.length < 3) {
            return res;
        }
        Arrays.sort(nums);
        for (int i = 0; i < nums.length - 2; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) {
                continue;//duplicated elements
            }
            twoSumUnique(nums, i + 1, nums.length - 1, nums[i], res);
        }
        return res;
    }

    private int twoSumUnique(int[] nums,
                             int start,
                             int end,
                             int target,
                             ArrayList<ArrayList<Integer>> res) {

        int count = 0;
        while (start < end) {
            int sum = nums[start] + nums[end];

            if (sum + target == 0) {
                ArrayList<Integer> cur = new ArrayList<>();
                cur.add(target);
                cur.add(nums[start]);
                cur.add(nums[end]);
                res.add(cur);

                count++;
                start++;
                end--;
                while (start < end && nums[start] == nums[start - 1]) {
                    start++;
                }
                while (start < end && nums[end] == nums[end + 1]) {
                    end--;
                }
            } else if (sum + target > 0) {
                end--;
            } else {
                start++;
            }
        }
        return count;
    }
}
