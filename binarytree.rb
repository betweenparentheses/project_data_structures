class Tree
  attr_reader :root_node
  
  def initialize(values)
    @root_node = nil
    build_tree(values)
  end

  
  def build_tree(values)
    values.shuffle!
    values.each do |value|
      add_node(value, @root_node)
    end
  end
  
  def breadth_first_search(value)

    #1Enqueue the root node
    queue = Array.new
    queue.unshift(@root_node)

    until queue.empty?
      #2Dequeue a node and examine it
      current = queue.pop
     #    If the element sought is found in this node, quit the search and return a result.
      if value == current.value
        return current
      else
        #    Otherwise enqueue any successors (the direct child nodes) that have not yet been discovered.
        queue.unshift(current.left_child) if current.left_child
        queue.unshift(current.right_child) if current.right_child
      end

    #4If the queue is not empty, repeat from Step 2.
    end
    
    #3 If the queue is empty, every node on the graph has been examined – quit the search and return "not found".
    nil
  end

  private
  
  def add_node(value, current_node = nil)
    if @root_node == nil 
      @root_node = Node.new(value)
    elsif value <= current_node.value
      if current_node.left_child == nil
        current_node.left_child = Node.new(value, {parent: current_node})
      else
        add_node(value, current_node.left_child)
      end
    elsif value >= current_node.value
      if current_node.right_child == nil
        current_node.right_child = Node.new(value, {parent: current_node})
      else
        add_node(value, current_node.right_child)
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

  def to_s
    if parent
      parent_value = parent.value
    end
    if left_child
      left_value = left_child.value
    end
    if right_child
      right_value = right_child.value
    end
    "value: #{value}, parent: #{parent_value||'none'}, left child: #{left_value||'none'}, right child: #{right_value||'none'}"
  end
  private
  
end

#test script
t = Tree.new([1, 3, 66, 3, 93, 56, 74, 88, 2, 17])
puts t.breadth_first_search(66)
