
class UniquePaths {
    
    /**
     state: f[m][n] how many unique paths from start to m,n
     init: f[0][0] = 0
     function: f[m][n] = f[m - 1][n] + f[m][n - 1]
     result: f[m - 1][n - 1]
     */
    func uniquePath(_ m: Int, n: Int) -> Int {
        
        if m == 0 || n == 0 {
            return 0
        }
        
        var f = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for i in 1 ..< m {
            f[i][0] = 1
        }
        
        for j in 1 ..< n {
            f[0][j] = 1
        }
        
        for i in 1 ..< m {
            for j in 1 ..< n {
                f[i][j] = f[i - 1][j] + f[i][j - 1]
            }
        }
        
        return f[m - 1][n - 1]
    }
    
    func uniquePathII(_ obstacleGrid: [[Int]]) -> Int {
        
        //init
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var f = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for i in 0 ..< m {
            if obstacleGrid[i][0] == 1 {
                break
            }
            f[i][0] = 1
        }
        
        for j in 0 ..< n {
            if obstacleGrid[0][j] == 1 {
                break
            }
            f[0][j] = 1
        }
        
        for i in 1 ..< m {
            for j in 1 ..< n {
                if obstacleGrid[i][j] == 1 {
                    f[i][j] = 0
                } else {
                    f[i][j] = f[i - 1][j] + f[i][j - 1]
                }
            }
        }
        
        return f[m - 1][n - 1]
    }
    
}
