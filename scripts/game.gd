extends Control

var well_done = preload("res://scenes/well_done.tscn")
var answer: String = ""
var last_answer: String = ""
@onready var wordLabel: Label = $Label
@onready var audioStreamPlayer: AudioStreamPlayer = $AudioStreamPlayer
#var play_finished: Callable
#var _finished: Callable
var well_done_finished: Callable
@onready var colorRect: ColorRect = $ColorRect
var words_dictionary = {
	"Kira1": {"use": "use_kira1_words", "file": "res://words/Kira_Oakwood1.txt"},
	"Kira2": {"use": "use_kira2_words", "file": "res://words/Kira_2.txt"},
	"Kira3": {"use": "use_kira3_words", "file": "res://words/Kira_3.txt"},
	"Xander1": {"use": "use_xander1_words", "file": "res://words/Xander_1.txt"},
	"Xander2": {"use": "use_xander2_words", "file": "res://words/Xander_2.txt"},
	"Xander3": {"use": "use_xander3_words", "file": "res://words/Xander_3.txt"},
	"Xander4": {"use": "use_xander4_words", "file": "res://words/Xander_4.txt"},
	"XanderMonth": {"use": "use_xander_weekday_words", "file": "res://words/Xander_Weekdays.txt"},
	"XanderWeekday": {"use": "use_xander_month_words", "file": "res://words/Xander_Months.txt"},
}

# Called when the node enters the scene tree for the first time.
func _ready():
	wordLabel.visible = false
	GlobalSettings.load_settings()
	colorRect.visible = GlobalSettings.show_overlay
	colorRect.color = GlobalSettings.overlay_color
	randomize()
	generate_answer()

func _on_line_edit_text_submitted(new_text):
	$LineEdit.clear()
	if new_text.to_lower() == answer.to_lower():
		# clear old guesses
		var count = $VBoxContainer.get_child_count()
		for i in range(count):
			var child = $VBoxContainer.get_child(0)
			$VBoxContainer.remove_child(child)
		# disable guessing
		$LineEdit.editable = false
		# play fanfare sound
		var sound = load("res://sounds/fanfare.ogg")
		audioStreamPlayer.stream = sound
		audioStreamPlayer.play(0.0)
		# play well done animation
		var well_done_instance = well_done.instantiate()
		$Label.add_sibling(well_done_instance)
		#add_child(well_done_instance)
		# start timer to generate next word
		well_done_finished = func ():
			remove_child(well_done_instance)
			if $Timer.timeout.is_connected(well_done_finished):
				$Timer.timeout.disconnect(well_done_finished)
			generate_answer()
			$LineEdit.editable = true
		$Timer.timeout.connect(well_done_finished)
		$Timer.start()
	else:
		var count = $VBoxContainer.get_child_count()
		var label = Label.new()
		label.set("theme_override_colors/font_color", Color.DARK_RED)
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.text = new_text
		$VBoxContainer.add_child(label)
		for i in range(count):
			var child = $VBoxContainer.get_child(0)
			$VBoxContainer.remove_child(child)
			$VBoxContainer.add_child(child)

func generate_answer():
	var answers = []
	for wordset in words_dictionary:
		var should_use = false
		var use = words_dictionary[wordset].use
		if use in GlobalSettings:
			should_use = GlobalSettings[use]
		if should_use:
			var filepath = words_dictionary[wordset].file
			var words = Words.load_file(filepath)
			answers += words
	if answers.is_empty():
		answers.append("toy")
		answers.append("me")
		answers.append("mum")
		answers.append("dad")
		answers.append("boy")
		answers.append("girl")
		answers.append("brother")
		answers.append("sister")
	while answer == last_answer:
		answer = answers[randi() % answers.size()]
	#answer = "composition"
	last_answer = answer
	#print(answer)
	wordLabel.text = answer
	#var sound = load("res://sounds/"+answer+".ogg")
	var sound = load("res://sounds/"+answer+".mp3")
	audioStreamPlayer.stream = sound
	play_word()
	$LineEdit.grab_focus()

func _on_texture_button_pressed():
	play_word()
	$LineEdit.grab_focus()

func play_word():
	audioStreamPlayer.finished.connect(word_finished)
	audioStreamPlayer.play(0.0)
	if GlobalSettings.show_words:
		wordLabel.visible = true

func word_finished():
	wordLabel.visible = false
	audioStreamPlayer.finished.disconnect(word_finished)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
