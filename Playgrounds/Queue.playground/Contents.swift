/*
  Queue
  In this implementation, enqueuing is an O(1) operation, dequeuing is O(n).
*/

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

//var queueOfNames = Queue(array: ["Carl", "Lisa", "Stephanie", "Jeff", "Wade"])
//queueOfNames.enqueue("Mike")
//print(queueOfNames.array)
//queueOfNames.dequeue()
//queueOfNames.front
//queueOfNames.isEmpty


