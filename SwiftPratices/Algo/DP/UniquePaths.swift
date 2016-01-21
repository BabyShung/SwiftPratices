
class UniquePaths {
    
    /**
     state: f[m][n] how many unique paths from start to m,n
     init: f[0][0] = 0
     function: f[m][n] = f[m - 1][n] + f[m][n - 1]
     result: f[m - 1][n - 1]
     */
    func uniquePath(m: Int, n: Int) -> Int {
        
        if m == 0 || n == 0 {
            return 0
        }
        
        var f = Array(count: m, repeatedValue: Array(count: n, repeatedValue: 0))
        
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
    
}