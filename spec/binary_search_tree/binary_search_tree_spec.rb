require './lib/binary_search_tree/binary_search_tree'

describe BinarySearchTree do
  describe '#insert 2 items' do
    it 'places an item at the root when the tree is empty' do
      tree = BinarySearchTree.new

      tree.insert(1)

      expect(tree.root.value).to eq 1
      expect(tree.root.left).to be_nil
      expect(tree.root.right).to be_nil
    end

    it 'places an item on the left if it is less than the root value' do
      tree = BinarySearchTree.new

      tree.insert(2)
      tree.insert(1)

      expect(tree.root.left.value).to eq 1
      expect(tree.root.right).to be_nil
    end

    it 'places an item on the right if it is greater than the root value' do
      tree = BinarySearchTree.new

      tree.insert(2)
      tree.insert(3)

      expect(tree.root.right.value).to eq 3
    end
  end

  describe '#insert duplicate values' do
    it 'ignores items with the same value as root' do
      tree = BinarySearchTree.new

      tree.insert(2)
      tree.insert(2)

      expect(tree.root.left).to be_nil
      expect(tree.root.right).to be_nil
    end

    it 'ignores items with the same value as root-left' do
      tree = BinarySearchTree.new

      tree.insert(2)
      tree.insert(1)
      tree.insert(1)

      expect(tree.root.right).to be_nil
      expect(tree.root.left.left).to be_nil
      expect(tree.root.left.right).to be_nil
    end

    it 'ignores items with the same value as root-right' do
      tree = BinarySearchTree.new

      tree.insert(1)
      tree.insert(2)
      tree.insert(2)

      expect(tree.root.left).to be_nil
      expect(tree.root.right.right).to be_nil
      expect(tree.root.right.left).to be_nil
    end
  end

  describe 'insert 3 values' do
    it 'places an item at root-left-left' do
      tree = BinarySearchTree.new

      tree.insert(3)
      tree.insert(2)
      tree.insert(1)

      expect(tree.root.left.value).to eq 2
      expect(tree.root.right).to be_nil
      expect(tree.root.left.left.value).to eq 1
      expect(tree.root.left.right).to be_nil
    end

    it 'places an item at root-left-right' do
      tree = BinarySearchTree.new

      tree.insert(3)
      tree.insert(1)
      tree.insert(2)

      expect(tree.root.left.value).to eq 1
      expect(tree.root.right).to be_nil
      expect(tree.root.left.right.value).to eq 2
      expect(tree.root.left.left).to be_nil
    end

    it 'places an item at root-right-left' do
      tree = BinarySearchTree.new

      tree.insert(1)
      tree.insert(3)
      tree.insert(2)

      expect(tree.root.left).to be_nil
      expect(tree.root.right.value).to eq 3
      expect(tree.root.right.left.value).to eq 2
      expect(tree.root.right.right).to be_nil
    end

    it 'places an item at root-right-right' do
      tree = BinarySearchTree.new

      tree.insert(1)
      tree.insert(2)
      tree.insert(3)

      expect(tree.root.left).to be_nil
      expect(tree.root.right.value).to eq 2
      expect(tree.root.right.left).to be_nil
      expect(tree.root.right.right.value).to eq 3
    end

    it 'places an item at root-left and root-right' do
      tree = BinarySearchTree.new

      tree.insert(2)
      tree.insert(1)
      tree.insert(3)

      expect(tree.root.left.value).to eq 1
      expect(tree.root.right.value).to eq 3
    end
  end

  describe '#initialize' do
    it 'accepts an array of items' do
      tree = BinarySearchTree.new([2, 1, 3])

      expect(tree.root.value).to eq 2
      expect(tree.root.left.value).to eq 1
      expect(tree.root.right.value).to eq 3
    end
  end

  describe '#find' do
    it 'returns the matching node if the value is in the tree' do
      tree = BinarySearchTree.new([5, 2, 3, 1, 8, 7, 9])

      result = tree.find(1)

      expect(result.value).to eq 1
    end

    it 'returns nil if the value is not in the tree' do
      tree = BinarySearchTree.new([5, 2, 3, 1, 8, 7, 9])

      result = tree.find(23)

      expect(result).to be_nil
    end
  end

  describe '#traverse_level_order' do
    it 'visits each node in level order' do
      tree = BinarySearchTree.new([5, 3, 7, 2, 4, 6, 8])

      result = []

      expected = [5, 3, 7, 2, 4, 6, 8]
      tree.traverse_level_order { |item| result.push(item) }

      expect(result).to eq(expected)
    end
  end

  describe '#traverse_pre_order' do
    it 'visits each node in depth first pre order' do
      tree = BinarySearchTree.new([5, 3, 7, 2, 4, 6, 8])

      result = []
      expected = [5, 3, 2, 4, 7, 6, 8]

      tree.traverse_pre_order { |item| result.push(item) }

      expect(result).to eq(expected)
    end
  end

  describe '#traverse_inorder' do
    it 'visits each node in depth first pre order' do
      tree = BinarySearchTree.new([5, 3, 7, 2, 4, 6, 8])

      result = []
      expected = [2, 3, 4, 5, 6, 7, 8]

      tree.traverse_inorder { |item| result.push(item) }

      expect(result).to eq(expected)
    end
  end

  describe '#traverse_post_order' do
    it 'visits each node in depth first pre order' do
      tree = BinarySearchTree.new([5, 3, 7, 2, 4, 6, 8])

      result = []
      expected = [2, 4, 3, 6, 8, 7, 5]

      tree.traverse_post_order { |item| result.push(item) }

      expect(result).to eq(expected)
    end
  end
end
