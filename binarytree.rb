module BinaryTree

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
  
  def set_left(new_child)
    @left_child ||= new_child
  end
  
  def set_right(new_child)
    @right_child ||= new_child
  end

  private
  
end

end
