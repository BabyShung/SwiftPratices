package LC;

/**
 * Created by haozheng on 2/3/17.
 */

class BSTIterator {
    private Stack<TreeNode> stack = new Stack<>();
    private TreeNode curt;

    // @param root: The root of binary tree.
    public BSTIterator(TreeNode root) {
        curt = root;
    }

    //@return: True if there has next node, or false
    public boolean hasNext() {
        return (curt != null || !stack.isEmpty());
    }

    //@return: return next node
    public TreeNode next() {
        while (curt != null) {
            stack.push(curt);
            curt = curt.left;
        }

        curt = stack.pop();
        TreeNode node = curt;
        curt = curt.right;

        return node;
    }
}

public class BinaryTree {

    //inorder traversal
    public ArrayList<Integer> inorderTraversal(TreeNode root) {
        ArrayList<Integer> res = new ArrayList<>();
        if (root == null) {
            return res;
        }
        Stack<TreeNode> stack = new Stack<>();
        TreeNode cur = root;
        while (!stack.isEmpty() || cur != null) {
            while (cur != null) {
                stack.push(cur);
                cur = cur.left;
            }
            TreeNode parent = stack.pop();
            res.add(parent.val);
            cur = parent.right;
        }
        return res;
    }

    //http://www.lintcode.com/en/problem/subtree-with-maximum-average/
    public TreeNode findSubtree2(TreeNode root) {
        helper(root);
        return lastTreeRT != null ? lastTreeRT.maxRoot : null;
    }

    private ResultType helper(TreeNode root) {
        if (root == null) {
            return new ResultType(0, 0, null);
        }

        ResultType left = helper(root.left);
        ResultType right = helper(root.right);
        ResultType result = new ResultType(
                left.sum + right.sum + root.val,//sum of all
                left.size + right.size + 1,//size of all
                root//current root
        );

        if (lastTreeRT == null ||
                lastTreeRT.sum * result.size < result.sum * lastTreeRT.size
                ) {
            lastTreeRT = result;
        }
        return result;//bring it back to its parent level
    }

    //http://www.lintcode.com/en/problem/binary-tree-longest-consecutive-sequence/#
    public int longestConsecutive(TreeNode root) {
        longest = 0;
        helper(root);
        return longest;
    }

    private int helper(TreeNode root) {
        if (root == null) {
            return 0;
        }

        int left = helper(root.left);
        int right = helper(root.right);

        int subtreeLongest = 1; // at least we have root
        if (root.left != null && root.val + 1 == root.left.val) {
            subtreeLongest = left + 1;
        }
        if (root.right != null && root.val + 1 == root.right.val) {
            subtreeLongest = right + 1;
        }

        if (subtreeLongest > longest) {
            longest = subtreeLongest;
        }
        return subtreeLongest;
    }

    private class ResultType {
        int maxInSubtree;
        int maxFromRoot;
        public ResultType(int maxInSubtree, int maxFromRoot) {
            this.maxInSubtree = maxInSubtree;
            this.maxFromRoot = maxFromRoot;
        }
    }

    public int longestConsecutiveRT(TreeNode root) {
        return helper(root).maxInSubtree;
    }

    private ResultType helper(TreeNode root) {
        if (root == null) {
            return new ResultType(0, 0);
        }

        ResultType left = helper(root.left);
        ResultType right = helper(root.right);

        // 1 is the root itself.
        ResultType result = new ResultType(0, 1);

        if (root.left != null && root.val + 1 == root.left.val) {
            result.maxFromRoot = left.maxFromRoot + 1;
        }

        if (root.right != null && root.val + 1 == root.right.val) {
            result.maxFromRoot = right.maxFromRoot + 1;
        }

        result.maxInSubtree = Math.max(
                result.maxFromRoot,
                Math.max(left.maxInSubtree, right.maxInSubtree)
        );

        return result;
    }

    //http://www.lintcode.com/en/problem/lowest-common-ancestor/#
    //http://www.lintcode.com/en/problem/lowest-common-ancestor-iii/
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode node1, TreeNode node2) {
        ResultType rt = helper(root, node1, node2);
        return (rt.a_exist && rt.b_exist) ? rt.node : null;
    }

    public ResultType helper(TreeNode root, TreeNode A, TreeNode B) {
        if (root == null)
            return new ResultType(false, false, null);

        ResultType left_rt = helper(root.left, A, B);
        ResultType right_rt = helper(root.right, A, B);

        boolean a_exist = left_rt.a_exist || right_rt.a_exist || root == A;
        boolean b_exist = left_rt.b_exist || right_rt.b_exist || root == B;

        if (root == A || root == B)
            return new ResultType(a_exist, b_exist, root);

        if (left_rt.node != null && right_rt.node != null)
            return new ResultType(a_exist, b_exist, root);
        if (left_rt.node != null)
            return new ResultType(a_exist, b_exist, left_rt.node);
        if (right_rt.node != null)
            return new ResultType(a_exist, b_exist, right_rt.node);

        return new ResultType(a_exist, b_exist, null);
    }
}
