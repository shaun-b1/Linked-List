# frozen_string_literal: true

require_relative 'linked_list'

class Node
  attr_accessor :next_node, :value

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
