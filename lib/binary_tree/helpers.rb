require_relative './binary_node'

# Helper for building binary tree
module Helpers
  # Given an array of values, build a binary tree
  # The first value of the array is the root
  # Examples
  # [1, 2, 3] => root = 1, root.left = 2, root.right = 3
  # [1, nil, 3]  => root = 1, root.left is empty, root.right = 3
  # [1, nil, 3, nil, 5] => root = 1, root.right = 3, root.right.right = 5
  def self.build_tree(values)
    return nil if values.empty?

    nodes = []

    root = BinaryNode.new(values.shift)
    nodes.push(root)

    until values.empty?
      n = nodes.shift

      left_value = values.shift
      unless left_value.nil?
        n.left = BinaryNode.new(left_value)
        nodes.push(n.left)
      end

      next if values.empty?

      right_value = values.shift
      unless right_value.nil?
        n.right = BinaryNode.new(right_value)
        nodes.push(n.right)
      end
    end

    root
  end

  # give the root of a binary tree, return the height of the tree
  def self.height(root)
    return 0 if root.nil?

    1 + [height(root.left), height(root.right)].max
  end
end
