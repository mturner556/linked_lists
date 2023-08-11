class LinkedList
  attr_accessor :head_node, :tail_node

  def initialize(value = nil)
    @head_node = Node.new(value)
    @tail_node = nil
    # @current_node = @head_node
  end 

  # append will add a new node to the end of the list 
  def append(value)
    current_node = @head_node
    while current_node.next_node != nil
      current_node = current_node.next_node
    end 
    @tail_node = current_node.next_node = Node.new(value)
    # maybe use ternary to set single element to equal head node and tail node 
  end 

  # prepends a new node to the beginning of the list 
  def prepend(value)
    current_node = @head_node
    @head_node = Node.new(value, current_node)
  end

  # the size method will count the number of nodes in the list 
  def size
    i = 1
    current_node = @head_node
    current_node.value ? i : 'Empty list, size:' + i -= 1
    while current_node.next_node != nil
      current_node = current_node.next_node
      i += 1
    end 
    i
  end 

  # returns the head_node and tail_node of the list 
  def head
    @head_node.value
  end 

  def tail
    @tail_node.value
  end

  # at(index) returns a given node at the specified index 
  def at(index)
    i = 0
    current_node = @head_node
    return current_node.value if i == index
    while current_node.next_node != nil
      current_node = current_node.next_node
      i += 1
      break if i == index
    end
    current_node.value
  end 

  # pop will pop the last node off of the list, removing it
  def pop
    previous_node = nil
    current_node = @head_node
    while current_node.next_node != nil
      previous_node = current_node
      current_node = current_node.next_node
    end 
    previous_node.next_node = current_node.next_node
    @tail_node = previous_node
  end 

  # contains?(value) returns boolean based on value passed in 
  def contains?(value)
    current_node = @head_node
    while current_node.value != value
      current_node = current_node.next_node
      break if current_node.value == value
      break if current_node.next_node == nil
    end 
    current_node.value == value ? true : false
  end 

  # find(value) returns the index of value, or nil if not found
  def find(value)
    current_node = @head_node
    i = 0 
    return 'Empty list.' if head == nil
    return i if current_node.value == value
    
    while current_node.next_node != nil
      current_node = current_node.next_node
      i += 1
      break if current_node.value == value
    end 

    i
  end 

  # represents the LinkedList as a string ( value ) -> nil 
  def to_s
    current_node = @head_node
    return puts "( #{head} ) -> nil" if current_node.next_node == nil
    while current_node.next_node != nil
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end 
    print 'nil'
  end 
end

# Node class creates a new node value and pointer to the next_node
class Node 
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new('hello')
list.append('world')
list.append('turner')
list.prepend('matt')
list.to_s
