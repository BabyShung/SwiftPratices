package LC.Parentheses;

/**
 * Created by haozheng on 2/12/17.
 */
public class ValidParentheses {
    public boolean isValid(String s) {
        Stack<Character> stack = new Stack<>();
        for (Character c : s.toCharArray()) {
            if (("([{").contains(String.valueOf(c))) {
                stack.push(c);
            } else {
                if (!stack.isEmpty() && isCombo(stack.peek(), c)) {
                    stack.pop();
                } else {
                    return false;
                }
            }
        }
        return stack.isEmpty();
    }

    private boolean isCombo(char a, char b) {
        return (a == '(' && b == ')') || (a == '{' && b == '}')
                || (a == '[' && b == ']');
    }
}
