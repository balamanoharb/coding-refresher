class Problem
  
  def self.solution(arr, key)
    linear_search(arr, key)
  end

  def self.linear_search(arr, key)
    arr.index(key) || -1
  end

end

require "./3.test"