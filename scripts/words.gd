extends Node
func load_file(filename):
	var result = []
	var file = FileAccess.open(filename, FileAccess.READ)
	while file.get_position() < file.get_length():
		var content = file.get_line()
		result.append(content)
	return result
