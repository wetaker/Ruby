
def bubbleSort(arr)
	for i in 0...arr.length
		for j in 0...arr.length-1
			if arr[j] > arr[j+1] 
				tmp = arr[j+1]
				arr[j+1] = arr[j]
				arr[j] = tmp
			end
		end
	end
	arr
end




p bubbleSort([5, 4, 3, 2, 1]); 