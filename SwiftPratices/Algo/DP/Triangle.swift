
class Triangle {
    
    /**
     function: f[i][j] = min(f[i-1][j-1], f[i-1][j]) + A[i][j]
     
     remember to initialize diagonal values and first column
     */
    
    func minimalPathSum(triangle: [[Int]?]?) -> Int {
        guard let outer = triangle where outer.count != 0 else {
            return 0
        }
        
        guard let inner = triangle![0] where inner.count != 0 else {
            return 0
        }
        
        //init
        let n = outer.count
        var f = Array(count: n, repeatedValue: Array(count: n, repeatedValue: 0))
        f[0][0] = outer[0]![0]
        
        for i in 1 ..< n {
            f[i][0] = f[i - 1][0] + outer[i]![0]
            f[i][i] = f[i - 1][i - 1] + outer[i]![i]
        }
        
        //top down
        for i in 1 ..< n {
            for j in 1 ..< i {
                f[i][j] = min(f[i - 1][j - 1], f[i - 1][j]) + outer[i]![j]
            }
        }
        
        var best = f[n - 1][0]
        for i in 1 ..< n {
            best = min(best, f[n - 1][i])
        }
        
        return best
    }
    
}