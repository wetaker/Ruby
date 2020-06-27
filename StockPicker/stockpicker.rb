
def stock_picker(days)
	# Takes array of days, for each day, loop over the following days and find the maximum followingDayPrice - dayPrice
	# Stores the data as a hash: Key = dayIndex, value = corresponding maximizer index
	dict = {}
	days.each_with_index do |day_price, ind|
		max_diff = -20
		max_ind = 0
		for future_day_ind in (ind+1)...days.length
			if days[future_day_ind] - day_price > max_diff
				max_diff = days[future_day_ind] - day_price
				max_ind = future_day_ind
			end
		end
		dict[ind] = max_ind
	end
	p dict

	# Have hash of maximizing day index for each day index, lets go over those and find the total maximum difference
	max_p = days[dict[0]] - days[0]
	indices = [0, dict[0]]
	dict.each do |low_ind, high_ind|
		if days[high_ind] - days[low_ind] > max_p
			max_p = days[high_ind] - days[low_ind]
			indices = [low_ind, high_ind]
		end
	end
	return indices
end


p stock_picker([17,3,6,9,15,8,6,1,10])


