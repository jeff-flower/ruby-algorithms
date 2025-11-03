require './lib/linked_list/linked_list'
require './lib/linked_list/node'

class DeleteTwos
  def self.delete_twos(head)
    dummy = Node.new(nil, head)
    prev = dummy 
    current = head

    until current.nil? do
      LinkedList.delete_node(prev, current) if is_two?(current) 
      prev = current unless is_two?(current) 
      current = current.after
    end

    dummy.after
  end

  def self.is_two?(node)
    node.value.nil? ? false : node.value == 2
  end
end