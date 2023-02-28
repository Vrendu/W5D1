# require 'enumerable'

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new 
    @tail = Node.new 
    @head.next = @tail 
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next 
  end

  def last
    @tail.prev  
  end

  def empty?
    first == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key,val)
    holdnode = last 
    holdnode.next = node 
    node.next = @tail 
    @tail.prev = node 
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    i = 0 
    until self[i].next.nil? 
      self[i]
      i += 1 
    end 
    self 
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end