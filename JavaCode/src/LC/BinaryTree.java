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
}
