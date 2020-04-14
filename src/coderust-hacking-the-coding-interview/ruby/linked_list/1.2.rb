# recursive solution
class Problem

  def self.solution(head)
    reverse(head)
  end

  def self.reverse(head)
    return head if !head || !head.next
    new_head = reverse(head.next)
    head.next.next = head
    head.next = nil
    return new_head
  end
end

require "./1.test"