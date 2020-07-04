

class BST
	attr_accessor :root
	def initialize(arr)
		arr.shuffle!
		@root = build_tree(arr)
	end


	# def build_tree(arr)
	# 	arr.sort!
	# 	root = Node.new(arr[(arr.length / 2).floor])
	# 	arr.each {|val| add(root, val)}
	# 	return root
	# end

	def build_tree(arr)
		return if arr.nil? || arr.length <= 0
		arr.sort!
		arr.uniq!
		root = Node.new(arr[(arr.length / 2).floor])
		root.left = build_tree(arr.slice(0...(arr.length/2).floor))
		root.right = build_tree(arr.slice((arr.length/2).floor+1...arr.length))
		return root
	end

	def add(root, val)
		if root.value == val
			return # Ignore duplicate values
		end
		# Base case
		if root.value < val && root.right == nil
			root.right = Node.new(val)
		elsif root.value > val && root.left == nil
			root.left = Node.new(val)
		end
		# Recursive step
		if val < root.value
			add(root.left, val)
		elsif val > root.value
			add(root.right, val)
		end
	end



	def insert(val, root = @root)
		if val > root.value
			if root.right.nil?
				root.right = Node.new(val)
			else 
				insert(val, root.right)
			end

		elsif val < root.value
			if root.left.nil?
				root.left = Node.new(val)
			else
				insert(val, root.left)
			end

		elsif val == root.value
			raise Exception.new("No duplicate values allowed")
		end

	end

	def delete(val, root = @root)
		# Base case
		if root.nil?
			return root
		end

		# Not found. Search here based off value
		if val < root.value
			root.left = delete(val, root.left)

		elsif val > root.value
			root.right = delete(val, root.right)

		# Not above two cases => root.value == val. So we return the replacement node.
		else

			# No left subtree => Just move up right subtree.
			if root.left.nil?
				tmp = root.right
				root = nil
				return tmp

			# No right subtree => Just move up left subtree.
			elsif root.right.nil?
				tmp = root.left
				root = nil
				return tmp
			end

			# Not above two cases => Both subtrees exist.
			# We take the replacement as the minimum valued node in the right subtree.
			tmp = min_value_node(root.right)
			root.value = tmp.value
			root.right = delete(temp.value, root.right)
		end
		return root
	end


	def min_value_node(root = @root)
		# Base case
		return root if root.left.nil?

		# Recursive step
		return min_value_node(root.left)
	end




	def find(value, root = @root)
		return root if root.value == value
		if value > root.value
			return find(value, root.right)
		elsif value < root.value 
			return find(value, root.left)
		end
	end

	def level_order(root = @root)
		remaining = Queue.new()
		remaining.push(root)
		while remaining.length > 0
			root = remaining.pop()
			remaining.push(root.left) if root.left
			remaining.push(root.right) if root.right
			yield root if block_given?
		end
	end

	def inorder(root = @root, &block)
		return unless root
		inorder(root.left, &block)
		yield root if block_given?
		inorder(root.right, &block)
	end

	def preorder(root = @root, &block)
		return unless root
		yield root if block_given?
		preorder(root.left, &block)
		preorder(root.right, &block)
	end

	def postorder(root = @root, &block)
		return unless root
		postorder(root.left, &block)
		postorder(root.right, &block)
		yield root if block_given?
	end


	# def depth(node, root = @root)
	# 	return false if node.nil?
	# 	depth = 0
	# 	while root != nil || root != node
	# 		if node.value > root.value
	# 			root = root.right
	# 			depth += 1 
	# 		elsif node.value < root.value
	# 			root = root.left
	# 			depth += 1
	# 		else
	# 			return depth
	# 		end
	# 	end
	# 	return false
	# end


	def depth(root)
		return 0 if root.nil?

		left_depth = depth(root.left)
		right_depth = depth(root.right)

		if left_depth > right_depth
			return left_depth + 1
		else
			return right_depth + 1
		end
	end

	def balanced?(root = @root)
		return true if root.nil?
		left = balanced?(root.left)
		right = balanced?(root.right)
		return left && right && (depth(root.left) - depth(root.right)).abs <= 1
	end


	def rebalance!()
		arr = []
		level_order {|x| arr.push(x.value)}
		@root = build_tree(arr)
	end


end

class Node 
	attr_accessor :value, :left, :right
	def initialize(value)
		@left = nil
		@right = nil
		@value = value
	end


end

# Driver script
arr = Array.new(15) {rand(1..100)}
tree = BST.new(arr)
puts "Balanced: #{tree.balanced?}"
puts " - - - Level - - - - - - - - - - - - - - - -"
tree.level_order {|node| puts node.value}

puts " - - - Preorder - - - - - - - - - - - - - - - -"
tree.preorder {|node| puts node.value}

puts " - - - Inorder - - - - - - - - - - - - - - - -"
tree.inorder {|node| puts node.value}

puts " - - - Postorder - - - - - - - - - - - - - - - -"
tree.postorder {|node| puts node.value}

puts 
puts "Unbalancing..."
tree.insert(500)
tree.insert(501)
tree.insert(502)
tree.insert(503)
tree.insert(504)
puts "Balanced: #{tree.balanced?}"

puts "Rebalancing..."
tree.rebalance!()
puts "Balanced: #{tree.balanced?}"
puts


puts " - - - Level - - - - - - - - - - - - - - - -"
tree.level_order {|node| puts node.value}

puts " - - - Preorder - - - - - - - - - - - - - - - -"
tree.preorder {|node| puts node.value}

puts " - - - Inorder - - - - - - - - - - - - - - - -"
tree.inorder {|node| puts node.value}

puts " - - - Postorder - - - - - - - - - - - - - - - -"
tree.postorder {|node| puts node.value}












