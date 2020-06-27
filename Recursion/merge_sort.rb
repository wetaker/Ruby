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



test_arr = Array.new(10) {rand(0..5)}
p test_arr 
p merge_sort(test_arr)


