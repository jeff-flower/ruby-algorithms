# Implementation of DFS traversals
class DFS
  # Assumes that root is a BinaryNode
  # Have to capture the block as an argument so it can be passed to recursive calls
  def self.preorder(root, &block)
    return if root.nil?

    yield(root.value) if block_given?

    preorder(root.left, &block)
    preorder(root.right, &block)
  end

  def self.inorder(root)
    return if root.nil?

    inorder(root.left)

    puts "#{root.value} "

    inorder(root.right)
  end

  def self.postorder(root)
    return if root.nil?

    postorder(root.left)
    postorder(root.right)
    puts "#{root.value} "
  end
end
