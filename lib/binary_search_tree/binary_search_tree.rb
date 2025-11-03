require './lib/node'
require 'pry-byebug'

# Binary Search Tree
class BinarySearchTree
  attr_reader :root

  def initialize(items = [])
    @root = nil
    items.each { |item| insert(item) }
  end

  def insert(item)
    if @root.nil?
      @root = Node.new(item)
    else
      insert_in_subtree(@root, item)
    end
  end

  def find(item)
    find_in_subtree(@root, item)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # calls given block with each item in the binary tree
  def traverse_level_order
    que = [@root]

    until que.empty?
      # TODO: check for empty value and nil current node to be safe?
      current = que.shift
      yield current.value
      que.push(current.left) unless current.left.nil?
      que.push(current.right) unless current.right.nil?
    end
  end

  def traverse_pre_order(&process_node)
    traverse(@root, 'preorder', &process_node)
  end

  def traverse_inorder(&process_node)
    traverse(@root, 'inorder', &process_node)
  end

  def traverse_post_order(&process_node)
    traverse(@root, 'postorder', &process_node)
  end

  private

  # order has one of 3 values: 'preorder', 'inorder', 'postorder'
  def traverse(parent, order, &process_node)
    return if parent.nil?

    process_node.call(parent.value) if order == 'preorder'

    traverse(parent.left, order, &process_node)

    process_node.call(parent.value) if order == 'inorder'

    traverse(parent.right, order, &process_node)

    process_node.call(parent.value) if order == 'postorder'
  end

  def find_in_subtree(parent, item)
    return nil if parent.nil?
    return parent if parent.value == item

    item < parent.value ? find_in_subtree(parent.left, item) : find_in_subtree(parent.right, item)
  end

  # recursive insertion
  # parent.value must not be nil
  def insert_in_subtree(parent, item)
    return false if parent.value == item

    if item < parent.value
      return insert_in_subtree(parent.left, item) unless parent.left.nil?

      insert_left(parent, item)
    else
      return insert_in_subtree(parent.right, item) unless parent.right.nil?

      insert_right(parent, item)
    end

    # return true when insert_right or insert_left happen to indicate successful insertion
    true
  end

  def insert_left(parent, item)
    parent.left = Node.new(item)
  end

  def insert_right(parent, item)
    parent.right = Node.new(item)
  end

  # search: add print method and helper for initialize
end
