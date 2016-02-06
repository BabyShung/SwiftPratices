
class ClimbingStairs {
    
    func climbStairs(n: Int) -> Int {
        //state: f[n] means the distinct ways you jump from 0 to n
        //function: f[n] = f[n - 1] + f[n - 2]
        //init f[0] = 0, f[1] = 1, f[2] = 2
        //result f[n]
        
        if (n < 1) {
            return 0
        }
        var f = Array(count: n, repeatedValue: 0)
        f[0] = 1
        f[1] = 2
        for i in 2 ..< n {
           f[i] = f[i - 1] + f[i - 2]
        }
        return f[n - 1]
    }
    
    func climbStairsImproved(n: Int) -> Int {
        if (n < 1) {
            return 0
        }
        if (n == 1 || n == 2) {
            return n
        }
        
        var first = 1
        var second = 2
        var ways = 0
        for _ in 3 ..< n {
            ways = first + second
            first = second
            second = ways
        }
        return ways
    }
}
