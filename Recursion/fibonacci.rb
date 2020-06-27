
def fibs_rec(n)
	raise Exception.new("Invalid input") if n<1
	return 1 if n==1 || n==2
	return fibs_rec(n-1) + fibs_rec(n-2)
end

p fibs_rec(1)
p fibs_rec(2)
p fibs_rec(3)
p fibs_rec(4)
p fibs_rec(5)