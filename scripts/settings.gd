extends CanvasLayer

@onready var show_words_checkbox = $VBoxContainer/GridContainer/CheckBox
@onready var show_overaly_checkbox = $VBoxContainer/GridContainer/CheckBox2
@onready var overlay_button = $VBoxContainer/GridContainer/ColorPickerButton
@onready var overlay_label = $VBoxContainer/GridContainer/Label3
@onready var use_kira1_checkbox = $VBoxContainer/GridContainer2/CheckBox
@onready var use_kira2_checkbox = $VBoxContainer/GridContainer2/CheckBox2
@onready var use_kira3_checkbox = $VBoxContainer/GridContainer2/CheckBox3
@onready var use_xander1_checkbox = $VBoxContainer/GridContainer3/CheckBox
@onready var use_xander2_checkbox = $VBoxContainer/GridContainer3/CheckBox2
@onready var use_xander3_checkbox = $VBoxContainer/GridContainer3/CheckBox3
@onready var use_xander4_checkbox = $VBoxContainer/GridContainer3/CheckBox4
@onready var use_xander_weekday_checkbox = $VBoxContainer/GridContainer3/CheckBox5
@onready var use_xander_month_checkbox = $VBoxContainer/GridContainer3/CheckBox6

func _ready() -> void:
	GlobalSettings.load_settings()
	show_words_checkbox.button_pressed = GlobalSettings.show_words
	show_overaly_checkbox.button_pressed = GlobalSettings.show_overlay
	overlay_button.disabled = GlobalSettings.show_overlay == false
	#overlay_label.disabled = GlobalSettings.show_overlay == false
	overlay_button.color = GlobalSettings.overlay_color
	use_kira1_checkbox.button_pressed = GlobalSettings.use_kira1_words
	use_kira2_checkbox.button_pressed = GlobalSettings.use_kira2_words
	use_kira3_checkbox.button_pressed = GlobalSettings.use_kira3_words
	use_xander1_checkbox.button_pressed = GlobalSettings.use_xander1_words
	use_xander2_checkbox.button_pressed = GlobalSettings.use_xander2_words
	use_xander3_checkbox.button_pressed = GlobalSettings.use_xander3_words
	use_xander4_checkbox.button_pressed = GlobalSettings.use_xander4_words
	use_xander_weekday_checkbox.button_pressed = GlobalSettings.use_xander_weekday_words
	use_xander_month_checkbox.button_pressed = GlobalSettings.use_xander_month_words

func _on_check_box_toggled(toggled_on: bool) -> void:
	GlobalSettings.show_words = toggled_on
	GlobalSettings.save_settings()

func _on_check_box_2_toggled(toggled_on: bool) -> void:
	GlobalSettings.show_overlay = toggled_on
	overlay_button.disabled = GlobalSettings.show_overlay == false
	#overlay_label.disabled = GlobalSettings.show_overlay == false
	GlobalSettings.save_settings()

func _on_color_picker_button_color_changed(color: Color) -> void:
	GlobalSettings.overlay_color = color
	GlobalSettings.save_settings()

func _on_kira1_check_box_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_kira1_words = toggled_on
	GlobalSettings.save_settings()

func _on_kira2_check_box_2_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_kira2_words = toggled_on
	GlobalSettings.save_settings()

func _on_kira3_check_box_3_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_kira3_words = toggled_on
	GlobalSettings.save_settings()

func _on_xander1_check_box_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_xander1_words = toggled_on
	GlobalSettings.save_settings()

func _on_xander2_check_box_2_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_xander2_words = toggled_on
	GlobalSettings.save_settings()

func _on_xander3_check_box_3_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_xander3_words = toggled_on
	GlobalSettings.save_settings()

func _on_xander4_check_box_4_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_xander4_words = toggled_on
	GlobalSettings.save_settings()

func _on_xander_weekday_check_box_5_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_xander_weekday_words = toggled_on
	GlobalSettings.save_settings()

func _on_xander_month_check_box_6_toggled(toggled_on: bool) -> void:
	GlobalSettings.use_xander_month_words = toggled_on
	GlobalSettings.save_settings()

func _on_button_pressed() -> void:
	GlobalSettings.save_settings()

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
