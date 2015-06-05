class Node

  attr_accessor :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end
end

class Tree

  attr_accessor :nodes, :root

  def initialize(nested_array, nodes = [])
    @nodes = nodes
    populate_nodes(nested_array)
    find_root
  end

  def populate_nodes(nested_array)
    value, left, right = nested_array
    if value
      n = Node.new(value, self.populate_nodes(left), self.populate_nodes(right))
      @nodes << n
    end
    n
  end

  #assumes unique values
  def find_root
    not_root = []

    @nodes.each do |node|
      not_root << node.left.value if node.left
      not_root << node.right.value if node.right
    end

    @nodes.each do |node|
      next if not_root.include?(node.value)
      @root = node
    end
  end

  def preorder_traverse(node, order = [])
    order << node.value
    preorder_traverse(node.left, order) if node.left
    preorder_traverse(node.right, order) if node.right
    order
  end

  def postorder_traverse(node, order = [])
    postorder_traverse(node.left, order) if node.left
    postorder_traverse(node.right, order) if node.right
    order << node.value
  end

  def inorder_traverse(node, order = [])
    inorder_traverse(node.left, order) if node.left
    order << node.value
    inorder_traverse(node.right, order) if node.right
    order
  end
end

tree = Tree.new([1, [2, [4, 7], [5]], [3, [6, [8], [9]]]])
p tree.nodes.count == 9
p tree.root.value == 1
p tree.preorder_traverse(tree.root) == [1, 2, 4, 7, 5, 3, 6, 8, 9]
p tree.postorder_traverse(tree.root) == [7, 4, 5, 2, 8, 9, 6, 3, 1]
p tree.inorder_traverse(tree.root) == [7, 4, 2, 5, 1, 8, 6, 9, 3]




