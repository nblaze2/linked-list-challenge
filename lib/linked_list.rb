require 'pry'
require_relative 'node'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def to_s
    node = self.info
    if node.nil?
      return "LinkedList()"
    end
    output = "LinkedList(#{node.info}"
    while node
      node = node.next_node
      if node.nil?
        break
      end
      output += ", #{node.data}"
    end
    output += ')'
  end

  def info
    @head
  end

  def each
    node = @head

    while !node.nil?
      yield(node)
      node = node.next_node
    end
  end

  def prepend(value)
    node = Node.new(value, @head)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def [](index)
    item = @head
    index.times do
      if item.next_node.nil?
        return item = nil
      else
        item = item.next_node
      end
    end
    item
  end

  def insert(index, value)
    if index == 0
      self.prepend(value)
    else
      prev_node = self[index - 1]
      next_node = self[index]
      prev_node.next_node = Node.new(value, next_node)
    end
  end

  def remove(index)
   if index == 0
     @head = self[index].next_node
   else
     prev_node = self[index - 1]
     this_node = self[index]
     next_node = self[index + 1]
     prev_node.next_node = next_node
     this_node.next_node = nil
   end
 end
end
