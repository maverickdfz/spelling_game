extends Node
class_name global_settings

const SAVE_DIR = "user://saves/"
const SAVE_EXT = ".sav"

var show_words: bool = true
var show_overlay: bool = false
var overlay_color: Color = Color(1, 0.270588, 0, 0.4)
var use_kira1_words: bool = true
var use_kira2_words: bool = true
var use_kira3_words: bool = true
var use_xander1_words: bool = true
var use_xander2_words: bool = true
var use_xander3_words: bool = true
var use_xander4_words: bool = true
var use_xander_weekday_words: bool = true
var use_xander_month_words: bool = true

func load_settings():
	var file_path = SAVE_DIR + "settings" + SAVE_EXT
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open_encrypted_with_pass(file_path, FileAccess.READ, "password")
		if file:
			var data = file.get_var(true)
			#print(data)
			if "show_words" in data:
				show_words = data.show_words
			if "show_overlay" in data:
				show_overlay = data.show_overlay
			if "overlay_color" in data:
				overlay_color = data.overlay_color
			if "use_kira1_words" in data:
				use_kira1_words = data.use_kira1_words
			if "use_kira2_words" in data:
				use_kira2_words = data.use_kira2_words
			if "use_kira3_words" in data:
				use_kira3_words = data.use_kira3_words
			if "use_xander1_words" in data:
				use_xander1_words = data.use_xander1_words
			if "use_xander2_words" in data:
				use_xander2_words = data.use_xander2_words
			if "use_xander3_words" in data:
				use_xander3_words = data.use_xander3_words
			if "use_xander4_words" in data:
				use_xander4_words = data.use_xander4_words
			if "use_xander_weekday_words" in data:
				use_xander_weekday_words = data.use_xander_weekday_words
			if "use_xander_month_words" in data:
				use_xander_month_words = data.use_xander_month_words
			file.close()

func save_settings():
	var data = {
		"show_words": show_words,
		"show_overlay": show_overlay,
		"overlay_color": overlay_color,
		"use_kira1_words": use_kira1_words,
		"use_kira2_words": use_kira2_words,
		"use_kira3_words": use_kira3_words,
		"use_xander1_words": use_xander1_words,
		"use_xander2_words": use_xander2_words,
		"use_xander3_words": use_xander3_words,
		"use_xander4_words": use_xander4_words,
		"use_xander_weekday_words": use_xander_weekday_words,
		"use_xander_month_words": use_xander_month_words
	}
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	var file_path = SAVE_DIR + "settings" + SAVE_EXT
	var file = FileAccess.open_encrypted_with_pass(file_path, FileAccess.WRITE, "password")
	if file:
		file.store_var(data)
		file.close()
