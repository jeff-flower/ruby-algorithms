require './lib/linked_list/node'

class ReverseList
  # reverse the order of a list
  # accepts the head of the list to reverse
  # returns the head of the reversed list
  # This method mutates the existing list and does not create a new list
  def self.reverse_list(head)
    reversed_head = nil
    current = head

    until current.nil?
      next_node = current.after
      current.after = reversed_head
      reversed_head = current
      current = next_node
    end

    reversed_head
  end
end