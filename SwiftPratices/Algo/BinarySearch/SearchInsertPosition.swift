
class SearchInsertPosition {
    func searchInsertPosition(array: [Int]?, target: Int) -> Int {
        guard let arr = array where arr.count > 0 else {
            return 0
        }
        
        var start = 0, end = arr.count - 1
        while start + 1 < end {
            let mid = start + (end - start) / 2
            if arr[mid] == target {
                return mid
            } else if arr[mid] > target {
                end = mid
            } else {
                start = mid
            }
        }
        if arr[start] >= target {
            return start
        } else if arr[end] >= target {
            return end
        } else {
            return end + 1
        }
    }
}