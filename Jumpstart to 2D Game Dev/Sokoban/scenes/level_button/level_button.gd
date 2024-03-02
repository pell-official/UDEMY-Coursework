extends NinePatchRect

@onready var level_label = $LevelLabel
@onready var checkmark = $Checkmark
const green_texture = preload("res://assets/green_panel.png")
var _level_number: String = "22"

func _ready():
	level_label.text = _level_number
	if ScoreSync.has_level_score(_level_number) == true:
		checkmark.show()

func _process(delta):
	pass

func set_level_number(level_number: String):
	_level_number = level_number

func _on_gui_input(event: InputEvent):
	if event.is_action_pressed("select") == true:
		texture = green_texture
		print("Selected: ", _level_number)
		SignalManager.on_level_selected.emit(_level_number)
