from itertools import product, permutations

num = 0
for a,b,c in product([1,2,3,4,5,6,7,8,9], repeat=3):
	if (a+b+c) in [14,5,23]:
		num += 1

print(num)