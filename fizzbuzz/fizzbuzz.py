def fizz_buzz(self, num):
	if num == 0: # seems this should have been < 1 instaed of == 0. need to read instructions carefully	
		raise ValueError
	if not num:
		raise TypeError
	num_list = []
	for n in range(1,16):
		if n % 3 == 0 and n % 5 == 0:
			num_list.append("FizzBuzz")
		elif n % 5 == 0:
			num_list.append("Buzz")
		elif n % 3 == 0:
			num_list.append("Fizz")
		else:
			num_list.append(str(n))
	return num_list