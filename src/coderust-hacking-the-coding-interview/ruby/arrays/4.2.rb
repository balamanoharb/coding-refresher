class Problem
  def self.solution(a,b,c)
    find_least_common_number(a,b,c)
  end

  def self.find_least_common_number(a, b, c)
    i = j = k = 0
    while( i < a.size && j < b.size && k < c.size )
      return a[i] if a[i] == b[j] && b[j] == c[k]
      max = [a[i], b[j], c[k]].max
      i = i + 1 if a[i] < max
      j = j + 1 if b[j] < max
      k = k + 1 if c[k] < max
    end
    return -1
  end

end

require "./4.test"