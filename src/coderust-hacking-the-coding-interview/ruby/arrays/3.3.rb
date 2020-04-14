class Problem

  def self.solution(arr, key)
    binary_search_rotated(arr, key)
  end

  def self.binary_search_modified_rec(arr, from, to, key)
    # assuming all the keys are unique.
    if (from > to)
      return -1
    end

    mid = from + ((to - from) / 2).floor

    if (arr[mid] == key)
      return mid
    end

    if (arr[from] < arr[mid] && key < arr[mid] && key >= arr[from])
      return binary_search_modified_rec(arr, from, mid - 1, key)
    elsif (arr[mid] < arr[to] && key > arr[mid] && key <= arr[to])
      return binary_search_modified_rec(arr, mid + 1, to, key)
    elsif (arr[from] > arr[mid])
      return binary_search_modified_rec(arr, from, mid - 1, key)
    elsif (arr[to] < arr[mid])
      return binary_search_modified_rec(arr, mid + 1, to, key)
    end

    return -1
  end

  def self.binary_search_rotated(arr, key)
    return binary_search_modified_rec(arr, 0, arr.length - 1, key)
  end

end

require "./3.test"