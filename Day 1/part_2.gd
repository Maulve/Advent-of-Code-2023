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
	var input_file = FileAccess.get_file_as_string("res://Day 1/input.txt")
	input_file = input_file.c_escape()
	
	var input: PackedStringArray = input_file.split("\\n", true)
	
	var output: PackedStringArray = []
	
	for line in input:
		var line_output: String = ""
		
		for word in ARR:
			if word in line:
				line = line.replace(word, str(DICT.get(word)))
		
		for ch in line:
			if int(ch):
				line_output += ch
		
		line_output = line_output.left(1) + line_output.right(1)
		
		output.append(line_output)
	
	print(output)
	
	print("---------")
	
	var sum: int = 0
	
	for num in output:
		sum += int(num)
	
	print(sum) # wrong :/
