/*
  Stack

  Push and pop are O(1) operations.
*/

public struct Stack<T> {
  fileprivate var array = [T]()

  public var count: Int {
    return array.count
  }

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public mutating func push(_ element: T) {
    array.append(element)
  }

  public mutating func pop() -> T? {
    return array.popLast()
  }

  public var top: T? {
    return array.last
  }
}

//var stackOfNames = Stack(array: ["Carl", "Lisa", "Stephanie", "Jeff", "Wade"])
//stackOfNames.push("Mike")
//print(stackOfNames.array)
//stackOfNames.pop()
//stackOfNames.top
//stackOfNames.isEmpty
