require "minitest/autorun"

describe Problem do
  it "test case 1" do
    v1 = [1, 6, 10, 14, 50]
    v2 = [-1, 6, 7, 8, 50]
    v3 = [0, 6, 7, 10, 25, 30, 50]
    result = Problem.solution(v1, v2, v3)
    assert result == 6
  end

  it "test case 2" do
    v1 = [1, 6, 10, 14, 50]
    v2 = [-1, 5, 7, 8, 50]
    v3 = [0, 6, 7, 10, 25, 30, 50]
    result = Problem.solution(v1, v2, v3)
    assert result == 50
  end

  it "test case 3" do
    v1 = [1, 6, 10, 14, 50]
    v2 = [-1, 5, 7, 8, 50]
    v3 = [0, 6, 7, 10, 25, 30, 51]
    result = Problem.solution(v1, v2, v3)
    assert result == -1
  end
end