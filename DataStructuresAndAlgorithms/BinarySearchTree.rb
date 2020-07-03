

class BST
	attr_accessor :root
	def initialize(arr)
		arr.shuffle!
		@root = build_tree(arr)
	end


	def build_tree(arr)
		arr.sort!
		root = Node.new(arr[(arr.length / 2).floor])
		arr.each {|val| add(root, val)}
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

	# def inorder(root = @root)
	# 	if root
	# 		inorder(root.left)
	# 		puts(root.value)
	# 		inorder(root.right)
	# 	end
	# end

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
			yield root
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


	class Node 
		include Comparable
		attr_accessor :value, :left, :right
		def initialize(value)
			@left = nil
			@right = nil
			@value = value
		end

		# def <=>(other)
		# 	@value <=> other.value
		# end
	end

end



test_arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = BST.new(test_arr)
tree.insert(100, tree.root)
p "-------"


arr = []
tree.level_order {|x| p x.value}

p "------"
tree.inorder {|x| p x.value}




