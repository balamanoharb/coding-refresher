require "./utils"

def test
  cases = [{
    inp: [1,2,3,4,5,6,7,8,9],
    key: 4,
    expected: 3
  }]
  
  total_passed = 0
  cases.each do |tc|
    result = binary_search(tc[:inp], tc[:key])
    total_passed += 1 if assert(tc[:expected], result)
  end
  puts "
===============Test Summary================
  #{'Total'.yellow}  - #{cases.size}
  #{'Passed'.green} - #{total_passed}
  #{'Failed'.red} - #{cases.size - total_passed}
==========================================="

end