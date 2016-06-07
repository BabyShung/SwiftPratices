
class BinarySearch {
    
    func binarySearch(nums: [Int]?, target: Int) -> Int {
        guard let nums = nums where nums.count > 0 else {
            return -1
        }
        var start = 0, end = nums.count - 1
        while (start + 1 < end) {
            let mid = start + (end - start) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                end = mid
            } else {
                start = mid
            }
        }
        if nums[start] == target {
            return start
        }
        if nums[end] == target {
            return end
        }
        return -1
    }
}