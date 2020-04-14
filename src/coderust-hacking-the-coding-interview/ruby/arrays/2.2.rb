class Problem

  def self.solution(arr, win_size)
    find_max_sliding_window(arr,win_size)
  end

  def self.find_max_sliding_window (arr, window_size)
    result = []
    window = []
    
    0.upto(window_size-1).each do |idx|
      while(window.size > 0 && arr[window.last] <= arr[idx]) do
        window.pop
      end
      window.push(idx)
    end
    result.push(arr[window.first])

    # slidig window of the rest
    window_size.upto(arr.size - 1).each do |idx|
      while(window.size > 0 && arr[window.last] <= arr[idx]) do
        window.pop
      end
      window.push(idx)
      window.shift if window.first <= idx - window_size
      result.push(arr[window.first])
    end
    return result
  end

end

require "./2.test"