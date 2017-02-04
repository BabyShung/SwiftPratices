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
}
