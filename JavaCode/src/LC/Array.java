package LC;

/**
 * Created by haozheng on 2/3/17.
 */
public class Array {


    //http://www.lintcode.com/en/problem/flatten-2d-vector/
    public class Vector2D implements Iterator<Integer> {

        private Iterator<List<Integer>> i;
        private Iterator<Integer> j;

        public Vector2D(List<List<Integer>> vec2d) {
            // Initialize your data structure here
            i = vec2d.iterator();
            j = null;
        }

        @Override
        public Integer next() {
            // Write your code here
            hasNext();
            return j.next();
        }

        @Override
        public boolean hasNext() {
            // Write your code here
            while ((j == null || !j.hasNext()) && i.hasNext())
                j = i.next().iterator();
            return j != null && j.hasNext();
        }

        @Override
        public void remove() {}
    }

/**
 * Your Vector2D object will be instantiated and called as such:
 * Vector2D i = new Vector2D(vec2d);
 * while (i.hasNext()) v[f()] = i.next();
 */

    //http://www.jiuzhang.com/solutions/median-of-two-sorted-arrays/
    public double findMedianSortedArrays(int A[], int B[]) {
        int len = A.length + B.length;
        if (len % 2 == 1) {
            return findKth(A, 0, B, 0, len / 2 + 1);
        }
        return (
                findKth(A, 0, B, 0, len / 2) + findKth(A, 0, B, 0, len / 2 + 1)
        ) / 2.0;
    }

    // find kth number of two sorted array
    public static int findKth(int[] A, int A_start,
                              int[] B, int B_start,
                              int k){
        if (A_start >= A.length) {
            return B[B_start + k - 1];
        }
        if (B_start >= B.length) {
            return A[A_start + k - 1];
        }

        if (k == 1) {
            return Math.min(A[A_start], B[B_start]);
        }

        int A_key = A_start + k / 2 - 1 < A.length
                ? A[A_start + k / 2 - 1]
                : Integer.MAX_VALUE;
        int B_key = B_start + k / 2 - 1 < B.length
                ? B[B_start + k / 2 - 1]
                : Integer.MAX_VALUE;

        if (A_key < B_key) {
            return findKth(A, A_start + k / 2, B, B_start, k - k / 2);
        } else {
            return findKth(A, A_start, B, B_start + k / 2, k - k / 2);
        }
    }
}
