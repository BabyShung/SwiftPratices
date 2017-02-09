
import UIKit

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

//http://www.lintcode.com/en/problem/merge-intervals/
func merge(_ intervals: [Interval]) -> [Interval] {
    guard intervals.count > 0 else {
        return []
    }
    let sort = intervals.sorted {$0.start < $1.start }
    var res: [Interval] = []
    var last = sort[0]
    for cur in sort {
        if last.end >= cur.start {
            //a includes b or a intersects b
            last.end = max(last.end, cur.end)
        } else {
            res.append(last)
            last = cur
        }
    }
    res.append(last)
    return res
}

//http://www.lintcode.com/en/problem/insert-interval/#
func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
    guard intervals.count > 0 else {
        return [newInterval]
    }
    var res: [Interval] = []
    var i = 0
    for cur in intervals {
        if cur.end < newInterval.start {
            i += 1
            res.append(cur)
        } else if cur.start > newInterval.end {
            res.append(cur)
        } else {
            newInterval.start = min(newInterval.start, cur.start)
            newInterval.end = max(newInterval.end, cur.end)
        }
    }
    res.insert(newInterval, at: i)
    return res
}

//https://leetcode.com/problems/meeting-rooms/
func canAttendMeetings(_ intervals: [Interval]) -> Bool {
    guard intervals.count > 0 else {
        return true
    }
    let sorted = intervals.sorted { $0.start < $1.start }
    var lastEnd = sorted[0].end
    for i in stride(from: 1, to: sorted.count, by: 1) {
        let cur = sorted[i]
        if lastEnd > cur.start {
            return false
        }
        lastEnd = max(lastEnd, cur.end)
    }
    return true
}

struct Point {
    let time: Int, flag: Int
    init(_ time: Int, _ flag: Int) {
        self.time = time
        self.flag = flag
    }
}

func minMeetingRooms(_ intervals: [Interval]) -> Int {
    var list: [Point] = []
    for i in intervals {
        list.append(Point(i.start, 1))
        list.append(Point(i.end, 0))
    }
    
    list.sort { (p1, p2) -> Bool in
        if p1.time == p2.time {
            return p1.flag - p2.flag < 0
        } else {
            return p1.time - p2.time < 0
        }
    }
    
    var count = 0, res = 0
    for p in list {
        if p.flag == 1 { //start
            count += 1
        } else {
            count -= 1
        }
        res = max(count, res)
    }
    return res
}





