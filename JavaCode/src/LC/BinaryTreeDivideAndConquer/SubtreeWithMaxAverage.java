package LC.BinaryTreeDivideAndConquer;

/**
 * Created by haozheng on 2/4/17.
 */

/**
 * Definition of TreeNode:
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left, right;
 *     public TreeNode(int val) {
 *         this.val = val;
 *         this.left = this.right = null;
 *     }
 * }
 */
public class SubtreeWithMaxAverage {
    private class ResultType {
        public int sum, size;
        TreeNode maxRoot;
        public ResultType(int sum, int size, TreeNode maxRoot) {
            this.sum = sum;
            this.size = size;
            this.maxRoot = maxRoot;
        }
    }

    private ResultType subtreeResult = null;

    /**
     * @param root the root of binary tree
     * @return the root of the maximum average of subtree
     */
    public TreeNode findSubtree2(TreeNode root) {
        helper(root);
        return subtreeResult != null ? subtreeResult.maxRoot : null;
    }

    private ResultType helper(TreeNode root) {
        if (root == null) {
            return new ResultType(0, 0, null);
        }

        ResultType left = helper(root.left);
        ResultType right = helper(root.right);
        ResultType result = new ResultType(
                left.sum + right.sum + root.val,
                left.size + right.size + 1,
                root
        );

        if (subtreeResult == null ||
                subtreeResult.sum * result.size < result.sum * subtreeResult.size
                ) {
            subtreeResult = result;
        }
        return result;
    }
}
