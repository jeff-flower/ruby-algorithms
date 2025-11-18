class BFS
  # calls optional block argument if provided
  # assume root and subsequent nodes are BinaryNode
  def self.traverse(root)
    # treat nodes as a queue (FIFO)
    nodes = [root]

    until nodes.empty?
      n = nodes.shift

      yield n.value if block_given?
      puts n.value unless block_given?

      nodes.push(n.left) unless n.left.nil?
      nodes.push(n.right) unless n.right.nil?
    end
  end
end
