# frozen_string_literal: true

require_relative 'node'

class List
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    iterator = 0
    node = @head
    until node.nil?
      node = node.next_node
      iterator += 1
    end
    iterator
  end

  def at(index)
    node = @head
    index.times do
      return puts 'there is no node at this index' if node.nil?

      node = node.next_node
    end
    node
  end

  def pop
    return nil if @head.nil?

    @head = @head.next_node
  end

  def contains?(value)
    iterator = 0
    node = @head
    while iterator <= size
      return false if node.nil?
      return true if node.value == value

      node = node.next_node
      iterator += 1
    end
  end

  def find(value)
    iterator = 0
    node = @head
    while iterator < size
      return iterator if node.value == value

      node = node.next_node
      iterator += 1
      return 'This value does not exist' if node.nil?
    end
  end

  def to_s
    iterator = 0
    node = @head
    while iterator < size
      print "( #{node.value} ) -> "
      node = node.next_node
      iterator += 1
      return 'nil' if node.nil?
    end
  end

  def insert_at(value, index)
    return puts 'This is outside the list' if index > size

    if index.zero?
      prepend(value)
    else
      new_node = Node.new(value, at(index))
      previous_node = at(index - 1)
      previous_node.next_node = new_node
      @tail = new_node if new_node.next_node.nil?
    end
  end

  def remove_at(index)
    return puts 'There is no node here to remove' if index > size

    if index.zero?
      @head = at(1)
    elsif at(index) == @tail
      @tail = at(index - 1)
      @tail.next_node = nil
    else
      previous_node = at(index - 1)
      previous_node.next_node = at(index + 1)
    end
  end
end
