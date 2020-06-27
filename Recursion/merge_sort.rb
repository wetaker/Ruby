require 'benchmark'
def merge_sort(arr)
	# Base case
	if arr.length() == 1
		return arr

	# Non-trivial case
	else
		# Partition
		mid = ((arr.length() - 1) / 2).floor
		l1 = arr.slice!(0..mid)
		l2 = arr

		# Recursive sort
		l1 = merge_sort(l1)
		l2 = merge_sort(l2)

		# Merge
		return merge(l1, l2)
	end
end


def merge(l1, l2) 
	list = (l1 + l2).sort()
end

# Alternate merge 
# def merge(l1, l2)
# 	list = []
# 	# Merge lists in sorted order
# 	while !l1.empty? && !l2.empty?
# 		if l1[0] < l2[0]
# 			list.push(l1.slice!(0))
# 		else
# 			list.push(l2.slice!(0))
# 		end
# 	end

# 	# Empty left-over elements
# 	while !l1.empty?
# 		list.push(l1.slice!(0))
# 	end
# 	while !l2.empty?
# 		list.push(l2.slice!(0))
# 	end

# 	return list
# end



test_arr = Array.new(100000) {rand(0..5)}
p test_arr

