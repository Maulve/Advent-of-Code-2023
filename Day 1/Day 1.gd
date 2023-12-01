extends Node2D

func _ready() -> void:
	var input_file = FileAccess.get_file_as_string("res://Day 1/input.txt")
	input_file = input_file.c_escape()
	
	var input: PackedStringArray = input_file.split("\\n", true)
	
	var output: PackedStringArray = []
	
	for line in input:
		var line_output: String = ""
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
	
	print(sum)
