
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

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
