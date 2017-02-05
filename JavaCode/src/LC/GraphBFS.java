package LC;

/**
 * Created by haozheng on 2/3/17.
 */
public class GraphBFS {

    //http://www.lintcode.com/en/problem/clone-graph/
    public UndirectedGraphNode cloneGraph(UndirectedGraphNode node) {
        // write your code here
        if (node == null) {
            return node;
        }
        //find all nodes
        ArrayList<UndirectedGraphNode> nodes = getNodes(node);

        //copy nodes
        HashMap<UndirectedGraphNode, UndirectedGraphNode> hm = new HashMap<>();
        for (UndirectedGraphNode cur : nodes) {
            hm.put(cur, new UndirectedGraphNode(cur.label));
        }

        //copy edges
        for (UndirectedGraphNode cur : nodes) {
            UndirectedGraphNode newNode = hm.get(cur);
            for (UndirectedGraphNode neighbor : cur.neighbors) {
                newNode.neighbors.add(hm.get(neighbor));
            }
        }

        return hm.get(node);
    }

    private ArrayList<UndirectedGraphNode> getNodes(UndirectedGraphNode node) {

        Queue<UndirectedGraphNode> queue = new LinkedList<>();
        HashSet<UndirectedGraphNode> set = new HashSet<>();

        queue.offer(node);
        set.add(node);

        while (!queue.isEmpty()) {
            UndirectedGraphNode cur = queue.poll();
            for (UndirectedGraphNode neighbor : cur.neighbors) {
                if (!set.contains(neighbor)) {
                    queue.offer(neighbor);
                    set.add(neighbor);
                }
            }
        }
        return new ArrayList<UndirectedGraphNode>(set);
    }

    //http://www.lintcode.com/en/problem/search-graph-nodes/
    public UndirectedGraphNode searchNode(ArrayList<UndirectedGraphNode> graph,
                                          Map<UndirectedGraphNode, Integer> values,
                                          UndirectedGraphNode node,
                                          int target) {
        if (node == null) {
            return node;
        }

        Queue<UndirectedGraphNode> queue = new LinkedList<>();
        HashSet<UndirectedGraphNode> visited = new HashSet<>();

        queue.offer(node);
        visited.add(node);

        while (!queue.isEmpty()) {
            UndirectedGraphNode cur = queue.poll();

            if (values.get(cur) == target) {
                return cur;
            }
            for (UndirectedGraphNode nei : cur.neighbors) {
                if (!visited.contains(nei)) {
                    queue.offer(nei);
                    visited.add(nei);
                }
            }
        }
        return null;
    }

    public ArrayList<DirectedGraphNode> topSort(ArrayList<DirectedGraphNode> graph) {
        // write your code here

        ArrayList<DirectedGraphNode> res = new ArrayList<DirectedGraphNode>();

        //collection in degree nodes
        HashMap<DirectedGraphNode, Integer> indegree = getIndegree(graph);

        //find all no degree nodes and enqueue
        Queue<DirectedGraphNode> queue = new LinkedList<DirectedGraphNode>();
        for (DirectedGraphNode node : graph) {
            if (!indegree.containsKey(node)) {
                queue.offer(node);
                res.add(node);
            }
        }

        //bfs
        while (!queue.isEmpty()) {
            DirectedGraphNode node = queue.poll();
            for (DirectedGraphNode neighbor : node.neighbors) {
                indegree.put(neighbor, indegree.get(neighbor) - 1);
                if (indegree.get(neighbor) == 0) {
                    res.add(neighbor);
                    queue.offer(neighbor);
                }
            }
        }
        return res;
    }

    //http://www.lintcode.com/en/problem/topological-sorting/
    private HashMap<DirectedGraphNode, Integer> getIndegree(ArrayList<DirectedGraphNode> graph) {
        HashMap<DirectedGraphNode, Integer> map = new HashMap<>();
        for (DirectedGraphNode node : graph) {
            for (DirectedGraphNode neighbor : node.neighbors) {
                if (map.containsKey(neighbor)) {
                    map.put(neighbor, map.get(neighbor) + 1);
                } else {
                    map.put(neighbor, 1);
                }
            }
        }
        return map;
    }

    http://www.lintcode.com/en/problem/course-schedule-ii/#
    public int[] findOrder(int numCourses, int[][] prerequisites) {
        // Write your code here

        int[] degree = new int[numCourses];
        ArrayList<ArrayList<Integer>> edges = new ArrayList<>();

        for (int i = 0; i < numCourses; i++) {
            edges.add(new ArrayList<Integer>());
        }

        for (int i = 0; i < prerequisites.length; i++) {
            degree[prerequisites[i][0]]++;
            ArrayList<Integer> nodes = edges.get(prerequisites[i][1]);
            nodes.add(prerequisites[i][0]);
        }

        Queue<Integer> queue = new LinkedList<>();
        for (int i = 0; i < numCourses; i++) {
            if (degree[i] == 0) {
                queue.offer(i);
            }
        }

        int count = 0;
        int[] res = new int[numCourses];
        while (!queue.isEmpty()) {
            int course = queue.poll();
            res[count] = course;
            count++;

            ArrayList<Integer> edge = edges.get(course);
            for (int i = 0; i < edge.size(); i++) {
                int pointer = edge.get(i);
                degree[pointer]--;
                if (degree[pointer] == 0) {
                    queue.offer(pointer);
                }

            }
        }

        if (count == numCourses) {
            return res;
        } else {
            return new int[0];
        }
    }

    //http://www.lintcode.com/en/problem/binary-tree-serialization/
    public String serialize(TreeNode root) {
        if (root == null) {
            return "{}";
        }

        ArrayList<TreeNode> queue = new ArrayList<TreeNode>();
        queue.add(root);

        for (int i = 0; i < queue.size(); i++) {
            TreeNode node = queue.get(i);
            if (node == null) {
                continue;
            }
            queue.add(node.left);
            queue.add(node.right);
        }

        while (queue.get(queue.size() - 1) == null) {
            queue.remove(queue.size() - 1);
        }

        StringBuilder sb = new StringBuilder();
        sb.append("{");
        sb.append(queue.get(0).val);
        for (int i = 1; i < queue.size(); i++) {
            if (queue.get(i) == null) {
                sb.append(",#");
            } else {
                sb.append(",");
                sb.append(queue.get(i).val);
            }
        }
        sb.append("}");
        return sb.toString();
    }

    /**
     * This method will be invoked second, the argument data is what exactly
     * you serialized at method "serialize", that means the data is not given by
     * system, it's given by your own serialize method. So the format of data is
     * designed by yourself, and deserialize it here as you serialize it in
     * "serialize" method.
     */
    public TreeNode deserialize(String data) {
        if (data.equals("{}")) {
            return null;
        }
        String[] vals = data.substring(1, data.length() - 1).split(",");
        ArrayList<TreeNode> queue = new ArrayList<TreeNode>();
        TreeNode root = new TreeNode(Integer.parseInt(vals[0]));
        queue.add(root);
        int index = 0;
        boolean isLeftChild = true;
        for (int i = 1; i < vals.length; i++) {
            if (!vals[i].equals("#")) {
                TreeNode node = new TreeNode(Integer.parseInt(vals[i]));
                if (isLeftChild) {
                    queue.get(index).left = node;
                } else {
                    queue.get(index).right = node;
                }
                queue.add(node);
            }
            if (!isLeftChild) {
                index++;
            }
            isLeftChild = !isLeftChild;
        }
        return root;
    }


    class Coordinate {
        int x, y;
        public Coordinate(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }

    public class Solution {
        public int EMPTY = 0;
        public int HOUSE = 1;
        public int WALL = 2;
        public int[][] grid;
        public int n, m;
        public int[] deltaX = {0, 1, -1, 0};
        public int[] deltaY = {1, 0, 0, -1};

        private List<Coordinate> getCoordinates(int type) {
            List<Coordinate> coordinates = new ArrayList<>();

            for (int i = 0; i < n; i++) {
                for (int j = 0; j < m; j++) {
                    if (grid[i][j] == type) {
                        coordinates.add(new Coordinate(i, j));
                    }
                }
            }

            return coordinates;
        }

        private void setGrid(int[][] grid) {
            n = grid.length;
            m = grid[0].length;
            this.grid = grid;
        }

        private boolean inBound(Coordinate coor) {
            if (coor.x < 0 || coor.x >= n) {
                return false;
            }
            if (coor.y < 0 || coor.y >= m) {
                return false;
            }
            return grid[coor.x][coor.y] == EMPTY;
        }

        /**
         * @param grid a 2D grid
         * @return an integer
         */
        public int shortestDistance(int[][] grid) {
            if (grid == null || grid.length == 0 || grid[0].length == 0) {
                return -1;
            }

            // set n, m, grid
            setGrid(grid);

            List<Coordinate> houses = getCoordinates(HOUSE);
            int[][] distanceSum = new int[n][m];;
            int[][] visitedTimes = new int[n][m];;
            for (Coordinate house : houses) {
                bfs(house, distanceSum, visitedTimes);
            }

            int shortest = Integer.MAX_VALUE;
            List<Coordinate> empties = getCoordinates(EMPTY);
            for (Coordinate empty : empties) {
                if (visitedTimes[empty.x][empty.y] != houses.size()) {
                    continue;
                }

                shortest = Math.min(shortest, distanceSum[empty.x][empty.y]);
            }

            if (shortest == Integer.MAX_VALUE) {
                return -1;
            }
            return shortest;
        }

        private void bfs(Coordinate start,
                         int[][] distanceSum,
                         int[][] visitedTimes) {
            Queue<Coordinate> queue = new LinkedList<>();
            boolean[][] hash = new boolean[n][m];

            queue.offer(start);
            hash[start.x][start.y] = true;

            int steps = 0;
            while (!queue.isEmpty()) {
                steps++;
                int size = queue.size();
                for (int temp = 0; temp < size; temp++) {
                    Coordinate coor = queue.poll();
                    for (int i = 0; i < 4; i++) {
                        Coordinate adj = new Coordinate(
                                coor.x + deltaX[i],
                                coor.y + deltaY[i]
                        );
                        if (!inBound(adj)) {
                            continue;
                        }
                        if (hash[adj.x][adj.y]) {
                            continue;
                        }
                        queue.offer(adj);
                        hash[adj.x][adj.y] = true;
                        distanceSum[adj.x][adj.y] += steps;
                        visitedTimes[adj.x][adj.y]++;
                    } // direction
                } // for temp
            } // while
        }
    }
}
