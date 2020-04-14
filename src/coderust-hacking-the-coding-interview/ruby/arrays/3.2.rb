class Problem
  
  def self.solution(a, key)
    binary_search_rotated(a, key)
  end

  def self.binary_search_rotated(a, key)
    low = 0
    high = a.size - 1
    while(low <= high)
      mid = low + (high - low)/2
      if(key == a[mid])
        return mid
      elsif a[low] <= a[mid]
        if(key < a[mid] && key >= a[low])
          high = mid - 1
        else
          low = mid + 1
        end
      else
        if(key > a[mid] && key <= a[high])
          low = mid + 1
        else
          high = mid - 1
        end
      end
    end
    return -1
  end

end

require "./3.test"