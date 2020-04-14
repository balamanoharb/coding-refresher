class Node
  attr_accessor :data, :next
  def initialize(val, ptr = nil)
    @data = val
    @next = ptr
  end

  def <<(node)
    self.next = node
  end

end

def make_list(arr)
  head = tail = Node.new(arr.first)
  arr[1..arr.size].each do |val|
    tail << Node.new(val)
    tail = tail.next
  end
  return head
end

def make_array(head)
  arr = []
  while(head)
    arr << head.data
    head = head.next
  end
  return arr
end