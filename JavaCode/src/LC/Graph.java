package LC;

/**
 * Created by haozheng on 2/3/17.
 */
public class Graph {

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
}
