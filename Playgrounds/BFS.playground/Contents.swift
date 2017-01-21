//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else {
        return res
    }
    var queue = [root]
    
    while !queue.isEmpty {
        var container: [Int] = []
        let size = queue.count
        for _ in stride(from: 0, to: size, by: 1) {
            let cur = queue.removeFirst()
            container.append(cur.val)
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        res.append(container)
    }
    //res.reverse()
    return res
}

var left2 = TreeNode(9)
var right2 = TreeNode(7)
var left1 = TreeNode(8)
var right1 = TreeNode(6)
var root = TreeNode(5)
root.left = left1
root.right = right1
left1.left = left2
left1.right = right2
levelOrder(root)


func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else {
        return res
    }
    var queue = [root]
    var queueFromLeft = true
    while !queue.isEmpty {
        var container: [Int] = []
        let size = queue.count
        for _ in stride(from: 0, to: size, by: 1) {
            let cur = queue.removeFirst()
            container.append(cur.val)
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        if !queueFromLeft {
            container.reverse()
        }
        queueFromLeft = !queueFromLeft
        res.append(container)
    }
    return res
}

//130. Surrounded Regions
func solve(_ board: inout [[Character]]) {
    let O: Character = "O"
    let X: Character = "X"
    let FREE: Character = "F"
    
    guard board.count >= 3 && board[0].count >= 3 else {
        return
    }
    
    let rows = board.count, cols = board[0].count
    
    for i in stride(from: 0, to: rows, by: 1) {
        srBFS(&board, i, 0)
        srBFS(&board, i, cols - 1)
    }

    for i in stride(from: 0, to: cols, by: 1) {
        srBFS(&board, 0, i)
        srBFS(&board, rows - 1, i)
    }
    
    for i in stride(from: 0, to: rows, by: 1) {
        for j in stride(from: 0, to: cols, by: 1) {
            switch board[i][j] {
            case O:
                board[i][j] = X
            case FREE:
                board[i][j] = O
            default:
                break
            }
        }
    }
}

struct SRNode {
    let x: Int, y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}


private func srBFS(_ board: inout [[Character]],
                   _ i: Int,
                   _ j: Int) {
    guard board[i][j] == "O" else {
        return
    }
    
    var queue: [SRNode] = []
    queue.append(SRNode(i, j))
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        board[cur.x][cur.y] = "F"
        for node in getSRNeighbor(&board, cur) {
            queue.append(node)
        }
    }
}

private func getSRNeighbor(_ board: inout [[Character]],
                           _ cur: SRNode) -> [SRNode] {
    let rows = board.count, cols = board[0].count
    var res: [SRNode] = []
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    for k in stride(from: 0, to: 4, by: 1) {
        let x = dx[k] + cur.x
        let y = dy[k] + cur.y
        if x >= 0 && x < rows && y >= 0 && y < cols && board[x][y] == "O" {
            res.append(SRNode(x, y))
        }
    }
    return res
}

let O: Character = "O"
let X: Character = "X"
//var srBoard = [
//    [O, X, X, X, X],
//    [O, O, X, X, X],
//    [O, X, X, O, X],
//    [O, X, O, O, X],
//    [O, O, X, O, X],
//]

//let source = [
//    "XOOOOOOOOOOOOOOOOOOO",
//    "OXOOOOXOOOOOOOOOOOXX",
//    "OOOOOOOOXOOOOOOOOOOX",
//    "OOXOOOOOOOOOOOOOOOXO",
//    "OOOOOXOOOOXOOOOOXOOX",
//    "XOOOXOOOOOXOXOXOXOXO",
//    "OOOOXOOXOOOOOXOOXOOO",
//    "XOOOXXXOXOOOOXXOXOOO",
//    "OOOOOXXXXOOOOXOOXOOO",
//    "XOOOOXOOOOOOXXOOXOOX",
//    "OOOOOOOOOOXOOXOOOXOX",
//    "OOOOXOXOOXXOOOOOXOOO",
//    "XXOOOOOXOOOOOOOOOOOO",
//    "OXOXOOOXOXOOOXOXOXOO",
//    "OOXOOOOOOOXOOOOOXOXO",
//    "XXOOOOOOOOXOXXOOOXOO",
//    "OOXOOOOOOOXOOXOXOXOO",
//    "OOOXOOOOOXXXOOXOOOXO",
//    "OOOOOOOOOOOOOOOOOOOO",
//    "XOOOOXOOOXXOOXOXOXOO"
//]
//var srBoard: [[Character]] = []
//for str in source {
//    srBoard.append([Character](str.characters))
//}
//
//print("xx")
//solve(&srBoard)
//print(srBoard)
//print("xxxxxee")


func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else {
        return 0
    }
    var gridVar = grid
    let rows = grid.count, cols = grid[0].count
    var count = 0
    for i in stride(from: 0, to: rows, by: 1) {
        for j in stride(from: 0, to: cols, by: 1) {
            //dfs
            if (gridVar[i][j] == "1") {
                count += 1
                islandDFS(&gridVar, i, j)
            }
        }
    }
    return count
}

private func islandDFS(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
    
    let rows = grid.count, cols = grid[0].count
    guard i >= 0 && i < rows && j >= 0 && j < cols && grid[i][j] == "1" else {
        return
    }
    grid[i][j] = "0"
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    for k in stride(from: 0, to: 4, by: 1) {
        let x = dx[k] + i
        let y = dy[k] + j
        islandDFS(&grid, x, y)
    }
}

//BFS WTF!
func numIslandsBFS(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else {
        return 0
    }
    var gridVar = grid
    let rows = grid.count, cols = grid[0].count
    var count = 0
    var visited = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    for i in stride(from: 0, to: rows, by: 1) {
        for j in stride(from: 0, to: cols, by: 1) {
            //dfs
            if (gridVar[i][j] == "1") {
                count += 1
                islandBFS(&gridVar, i, j, &visited)
            }
        }
    }
    return count
}

private func islandBFS(_ grid: inout [[Character]],
                       _ i: Int,
                       _ j: Int,
                       _ visited: inout [[Int]]) {
    
    let rows = grid.count, cols = grid[0].count
    var queue: [SRNode] = [SRNode(i, j)]
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        grid[cur.x][cur.y] = "0"
        visited[cur.x][cur.y] = 1
        
        let dx = [1, -1, 0, 0]
        let dy = [0, 0, 1, -1]
        for k in stride(from: 0, to: 4, by: 1) {
            let x = dx[k] + cur.x
            let y = dy[k] + cur.y
            guard x >= 0 && x < rows && y >= 0 && y < cols && grid[x][y] == "1" && visited[x][y] == 0 else {
                continue
            }
            visited[x][y] = 1
            queue.append(SRNode(x, y))
        }
    }
}

//var numIslandArr: [[Character]] = []
//let numIslandSource = ["11111011111111101011","01111111111110111110","10111001101111111111","11110111111111111111","10011111111111111111","10111111011101110111","01111111111101101111","11111111111101111011","11111111110111111111","11111111111111111111","01111111011111111111","11111111111111111111","11111111111111111111","11111011111110111111","10111110111011110111","11111111111101111110","11111111111110111100","11111111111111111111","11111111111111111111","11111111111111111111"]
//for str in numIslandSource {
//    let charArr = [Character](str.characters)
//    numIslandArr.append(charArr)
//}
//numIslandsBFS(numIslandArr)



