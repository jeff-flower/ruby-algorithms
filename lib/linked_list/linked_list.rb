require './lib/linked_list/node'

class LinkedList
  
  # Given an array of values, create a linked list for each value in the array
  # Return a pointer to the first item in the list
  def self.create_list(arr)
    return nil if arr.empty?

    head = Node.new(arr.first)
    current = head 
    prev = nil

    arr.drop(1).each do |value|
      prev = current
      current = Node.new(value) 
      prev.after = current
    end

    head
  end

  # Given a pointer to the head of a linked list
  # Print the value for each node
  def self.print_list(head)
    output = ""

    current = head

    until current.nil? do
      output << "#{current.value}"
      output << " -> " unless current.after.nil?
      current = current.after
    end

    output
  end

  # Insert a new node after node
  # returns the newly created node
  def self.insert_node(node, value)
    node_to_insert = Node.new(value, node.after)
    node.after = node_to_insert

    node_to_insert
  end

  # Removes the node after the provided node
  # Both prev and current must be nodes
  def self.delete_node(prev, current)
    prev.after = current.after
  end
end