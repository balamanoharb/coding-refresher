require "minitest/autorun"

describe Problem do
  it "test case 1" do
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    win_size = 3
    result = Problem.solution(arr, win_size)
    assert result == [3, 4, 5, 6, 7, 8, 9, 10]
  end

  it "test case 2" do
    arr = [1, 2, 3, 1, 4, 5, 2, 3, 6]
    win_size = 3
    result = Problem.solution(arr, win_size)
    assert result == [3, 3, 4, 5, 5, 5, 6]
  end
  
  it "test case 3" do
    arr = [8, 5, 10, 7, 9, 4, 15, 12, 90, 13]
    win_size = 4
    result = Problem.solution(arr, win_size)
    assert result == [10, 10, 10, 15, 15, 90, 90]
  end
  
end