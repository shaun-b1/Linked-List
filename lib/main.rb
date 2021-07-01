# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

list = List.new
list.prepend(1)
list.prepend(2)
list.prepend(3)
list.prepend(5)
list.prepend(6)
list.insert_at(4, 2)
list.remove_at(1)
puts list
