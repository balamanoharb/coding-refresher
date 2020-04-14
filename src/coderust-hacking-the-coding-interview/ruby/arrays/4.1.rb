class  Problem
  def self.solution( a, b, c)
    find_least_common_number(a,b,c)
  end

  def self.find_least_common_number(a, b, c)
    i = 0
    j = 0
    k = 0
  
    while (i < a.length && j < b.length && k < c.length)
      
      if (a[i] == b[j] && b[j] == c[k])
        return a[i]
      end
  
      if (a[i] <= b[j] && a[i] <= c[k])
        i+=1
      elsif (b[j] <= a[i] && b[j] <= c[k])
        j+=1
      elsif (c[k] <= a[i] && c[k] <= b[j])
        k+=1
      end
  
    end
  
    return -1
  end

  
end

require "./4.test"