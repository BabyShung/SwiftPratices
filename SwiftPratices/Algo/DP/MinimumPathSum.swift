//
//  MinimumPathSum.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 1/19/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

class MinimumPathSum {
    
    func minPathSum(grid: [[Int]]) -> Int {
        
//        guard let grid = grid where grid.count != 0 else {
//            return 0
//        }
//        
//        guard let firstRow = grid[0] where firstRow.count != 0 else {
//            return 0
//        }
        
        //initialze
        let rows = grid.count
        let columns = grid[0].count
        var f = Array(count: rows, repeatedValue: Array(count: columns, repeatedValue: 0))
        
        f[0][0] = grid[0][0]
        
        for i in 1 ..< rows {
            f[i][0] = f[i - 1][0] + grid[i][0]
        }
        
        for j in 1 ..< columns {
            f[0][j] = f[0][j - 1] + grid[0][j]
        }
        
        //function: f[m][n] = min(f[m - 1][n], f[m][n - 1]) + A[m][n]
        //top down
        for i in 1 ..< rows {
            for j in 1 ..< columns {
                f[i][j] = min(f[i - 1][j], f[i][j - 1]) + grid[i][j]
            }
        }
        
        //result
        return f[rows - 1][columns - 1]
    }
    
}
