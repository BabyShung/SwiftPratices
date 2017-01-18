
public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}

//class UndirectedGraphNode : Hashable, Equatable {
//    let label: Int
//    let neighbors: [UndirectedGraphNode]
//    init(_ label: Int, _ neighbors: [UndirectedGraphNode]) {
//        self.label = label
//        self.neighbors = neighbors
//    }
//    
//    var hashValue: Int {
//        return 0
//    }
//}
//
//func cloneGraph(head: UndirectedGraphNode) -> UndirectedGraphNode {
//    let nodes = getNodes(head)
//    
//    
//}
//
//private func getNodes(_ node: UndirectedGraphNode) -> [UndirectedGraphNode] {
//    var queue = Queue<UndirectedGraphNode>()
//    var dict = [UndirectedGraphNode : UndirectedGraphNode]()
//    
//    queue.enqueue(node)
//    dict
//    
//}









