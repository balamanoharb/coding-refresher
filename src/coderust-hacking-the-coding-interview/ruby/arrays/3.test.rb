require "minitest/autorun"

describe Problem do
  it "test case 1" do
    arr = [5, 6, 7, 8, 9, 10, 1, 2, 3]
    key = 3
    result = Problem.solution(arr, key)
    assert result == 8
  end

  it "test case 2" do
    arr = [1, 2, 3, 1, 4, 5, 2, 3, 6]
    key = 30
    result = Problem.solution(arr, key)
    assert result == -1
  end
  
  it "test case 3" do
    arr = [30, 40, 50, 10, 20]
    key = 10
    result = Problem.solution(arr, key)
    assert result == 3
  end
  
end