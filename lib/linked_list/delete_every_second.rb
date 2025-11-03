require './lib/linked_list/linked_list'

class DeleteEverySecond
  # Delete every other item in a linked list starting with the second item
  def self.delete_every_second(head)
    first = head

    until end_of_list?(first) do
      second = first.after
      LinkedList.delete_node(first, second)
      first = second.after
    end
    
  end

  def self.end_of_list?(node)
    node.nil? || node.after.nil?
  end
end