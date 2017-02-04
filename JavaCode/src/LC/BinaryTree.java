package LC;

/**
 * Created by haozheng on 2/3/17.
 */
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



}
