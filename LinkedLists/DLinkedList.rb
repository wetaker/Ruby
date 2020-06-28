class LinkedList


	# Constructor
	def initialize()
		@head = nil
		@tail = nil
		@size = 0

	end

	# Methods

	# Getters
	attr_reader :head, :tail, :size


	def append(value) # Creates node with given value and adds to end of list
		if @size != 0
			new_node = DNode.new(self.tail, nil, value)
			@tail.nxt = new_node
			@tail = new_node
			@size += 1
		else
			new_node = DNode.new(nil, nil, value)
			@tail = new_node
			@head = new_node
			@size += 1
		end
	end

	def prepend(value) # Creates node with given value and adds to beginning of list
		if @size != 0 
			new_node = DNode.new(nil, self.head , value)
			@head.prev = new_node
			@head = new_node
			@size += 1
		else
			new_node = DNode.new(nil, nil, value)
			@head = new_node
			@tail = new_node
			@size += 1
		end
	end

	def at(index) # Returns node at specified index
		result = @head
		index.times {result = result.nxt}
		return result
	end

	def display() # Displays each value of the list on separate lines
		tmp = @head
		while tmp != nil
			p tmp.value
			tmp = tmp.nxt
		end
	end

	def pop() # Removes the last node from the list and returns its value.
		tmp = @tail
		@tail.prev.nxt = nil
		return tmp.value
	end

	def contains?(value) # Returns true if list contains the value, otherwise false.
		tmp = @head
		while tmp != nil
			return true if tmp.nxt.value == value
			tmp = tmp.nxt
		end
		return false
	end

	def find(value) # Returns index of value if it exists, otherwise returns nil.
		index = 0
		tmp = @head
		while tmp != nil
			return index if tmp.value == value
			index += 1
			tmp = tmp.nxt
		end
		return nil
	end

	def to_s()
		str = "(#{@head.value.to_s})"
		tmp = @head.nxt unless @head.nxt.nil?
		while tmp != nil
			str += '<-->'
			str += "(#{tmp.value.to_s})"
			tmp = tmp.nxt
		end
		return str
	end


	# Nested dependant class
	private
	class DNode

		# Getters/Setters
		attr_accessor :prev, :nxt, :value

		# Constructor
		def initialize(prev = nil, nxt = nil, value = nil)
			@prev = prev
			@nxt = nxt
			@value = value
		end


	end
end

list = LinkedList.new()
node1 = LinkedList::DNode.new()
list.append('a')
list.append('b')
list.prepend('c')
list.display()
p list.to_s
