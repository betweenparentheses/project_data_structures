class Tree
  attr_reader :root_node
  
  def initialize(values)
    @root_node = nil
    build_tree(values)
  end

  
  def build_tree(values)
    values.shuffle!
    values.each do |value|
      add_node(value)
    end
  end
  
  def add_node(current_node = nil, value)
    if @root_node == nil 
      @root_node = Node.new(value)
    elsif value <= current_node.value
      if current_node.left_child == nil
        current_node.left_child = Node.new(value, {parent: current_node})
      else
        add_node(current_node.left_child, value)
      end
    elsif value >= current_node.value
      if current_node.right_child == nil
        current_node.right_child = Node.new(value, {parent: current_node})
      else
        add_node(current_node.right_child, value)
      end
    end
    
  end
  
end

class Node
  attr_accessor :value
  def initialize(value, nodes = {})
    @value = value
    @parent = nodes[:parent] || nil
    @left_child = nodes[:left_child] || nil
    @right_child = nodes[:right_child] || nil
  end
  
  public 
  
  def parent
    @parent
  end
  
  def left_child
    @left_child
  end
  
  
  def right_child
    @right_child
  end
  
  def left_child=(new_child)
    @left_child = new_child
  end
  
  def right_child=(new_child)
    @right_child = new_child
  end

  private
  
end

