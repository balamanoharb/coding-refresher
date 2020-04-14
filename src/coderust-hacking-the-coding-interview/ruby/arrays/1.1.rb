require "./1.test"

def binary_search_rec(arr, key, low, high)
    return -1 if low > high
    mid = low + ( high - low) / 2
    if( arr[mid] === key)
        return mid
    elsif( arr[mid] > key)
        return binary_search_rec(arr, key, low, mid - 1)
    else
        return binary_search_rec(arr, key, mid + 1, high)
    end
end

def binary_search(arr, key)
    return binary_search_rec(arr, key, 0, arr.size - 1)
end

test