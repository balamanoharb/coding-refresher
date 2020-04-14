require "./1.test"

def binary_search(arr, key)
  low = 0
  high = arr.size - 1

  while(low <= high)
    mid = low + ( (high - low) / 2)
    if(arr[mid] == key)
      return mid
    elsif(arr[mid] > key)
      high = mid - 1
    else
      low = mid + 1
    end
  end
  return -1
end

test