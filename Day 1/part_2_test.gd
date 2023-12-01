extends Node2D

const ARR: Array[String] = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

const DICT: Dictionary = {
	"one": 1,
	"two": 2,
	"three": 3,
	"four": 4,
	"five": 5,
	"six": 6,
	"seven": 7,
	"eight": 8,
	"nine": 9
}

func _ready() -> void:
	var input_file = FileAccess.get_file_as_string("res://Day 1/input_test.txt")
	input_file = input_file.c_escape()
	
	var input: PackedStringArray = input_file.split("\\n", true)
	
	var output: PackedStringArray = []
	
	for line in input:
		var line_output: String = ""
		
		print("Line: " + line)
		
		# replaces word numbers with digits
		
		var s_dict: Dictionary
		
		for word in ARR:
			if word in line:
				s_dict[line.find(word)] = DICT.get(word)
				
		var s_arr: Array[int]
		for i in s_dict:
			s_arr.append(i)
		s_arr.sort()
		
		var count := 0
		
		for ch in line:
			for i in s_arr:
				if i == count:
					line_output += str(s_dict[i])
				
				elif int(ch):
					line_output += ch
					
			count += 1
		
		# only picks first and last
		if line_output.length() > 2:
			line_output = line_output.left(1) + line_output.right(1)
		
		print("Output: " + line_output)
		
		print("----------------")
		
		output.append(line_output)
	
	print(output)

	print("---------")

	var sum: int = 0

	for num in output:
		sum += int(num)

	print(sum) # still wrong :/ , too low
