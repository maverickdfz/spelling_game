extends CanvasLayer

@onready var quit_button: TextureButton = $TextureButton3

func _ready() -> void:
	#print(OS.get_name())
	quit_button.visible = (OS.get_name() == "Windows" or OS.get_name() == "Linux" or OS.get_name() == "macOS")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_button_3_pressed() -> void:
	get_tree().quit()
