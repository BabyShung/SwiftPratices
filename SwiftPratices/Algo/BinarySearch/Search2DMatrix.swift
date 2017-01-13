
class Search2DMatrix {
    func search(_ matrix: [[Int]]?, target: Int) -> Bool {
        guard let mtx = matrix, mtx.count > 0 else {
            return false
        }
        
        var start = 0, end = mtx.count - 1
        
        while start + 1 < end {
            let mid = start + (end - start) / 2
            if mtx[mid][0] == target {
                return true
            } else if mtx[mid][0] > target {
                end = mid
            } else {
                start = mid
            }
        }
        var row: Int
        if mtx[end][0] <= target {
            row = end
        } else if mtx[start][0] <= target {
            row = start
        } else {
            return false
        }
        
        start = 0
        end = mtx[row].count - 1
        
        while start + 1 < end {
            let mid = start + (end - start) / 2
            if mtx[row][mid] == target {
                return true
            } else if mtx[row][mid] > target {
                end = mid
            } else {
                start = mid
            }
        }
        
        if mtx[row][start] == target || mtx[row][end] == target {
            return true
        } else {
            return false
        }
    }
}
