require "minitest/autorun"
require "./utils"

describe Problem do

  it "test case 1 - nil" do
    assert Problem.solution(nil) == nil
  end

  it "test case 2 - 1 element" do
    arr = [1]
    head = make_list(arr)
    rev_head = Problem.solution(head)
    assert_equal arr.reverse, make_array(rev_head)
  end

  it "test case 3 - 2 elements" do
    arr = [1, 2]
    head = make_list(arr)
    rev_head = Problem.solution(head)
    assert_equal arr.reverse, make_array(rev_head)
  end
  
  it "test case 4" do
    arr = [1, 2, 3]
    head = make_list(arr)
    rev_head = Problem.solution(head)
    assert_equal arr.reverse, make_array(rev_head)
  end

  it "test case 5" do
    arr = [1, 2, 3, 4]
    head = make_list(arr)
    rev_head = Problem.solution(head)
    assert_equal arr.reverse, make_array(rev_head)
  end
  
end