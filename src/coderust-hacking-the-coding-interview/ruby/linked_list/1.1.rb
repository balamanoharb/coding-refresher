# This is iterative solution
class Problem

  def self.solution(head)
    reverse(head)
  end

  def self.reverse(head)
    return head if !head || !head.next
    new_head = nil
    cur = head
    while(cur)
      next_element = cur.next
      cur.next = new_head
      new_head = cur
      cur = next_element
    end
    return new_head
  end
end

require "./1.test"