class Problem

  def self.solution(arr, win_size)
    find_max_sliding_window(arr, win_size)
  end

  def self.find_max_sliding_window( arr, window_size )
    result = []
    max = arr.first
    0.upto(arr.size - window_size).each do |idx|
      idx.upto(idx + window_size - 1).each do |cur|
        max = arr[cur] if arr[cur] > max
      end
      result.push max
    end
    return result
  end

end

require "./2.test"