extends Control

var well_done = preload("res://scenes/well_done.tscn")
var answer: String
@onready var audioStreamPlayer: AudioStreamPlayer = $AudioStreamPlayer
#var play_finished: Callable
#var _finished: Callable
var well_done_finished: Callable

# Called when the node enters the scene tree for the first time.
func _ready():
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
		add_child(well_done_instance)
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
	var answers = Words.get_words_by_category([
		Words.CATEGORIES.colors,
		Words.CATEGORIES.calendar,
		Words.CATEGORIES.ly,
		Words.CATEGORIES.ty,
		Words.CATEGORIES.en,
		Words.CATEGORIES.de,
		Words.CATEGORIES.re,
		Words.CATEGORIES.al
	])
	answer = answers[randi() % answers.size()]
	#print(answer)
	#var sound = load("res://sounds/"+answer+".ogg")
	var sound = load("res://sounds/"+answer+".wav")
	audioStreamPlayer.stream = sound
	audioStreamPlayer.play(0.0)

func _on_texture_button_pressed():
	audioStreamPlayer.play(0.0)
