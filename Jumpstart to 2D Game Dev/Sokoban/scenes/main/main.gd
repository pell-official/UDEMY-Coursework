extends CanvasLayer

@onready var grid_container = $MC/VBoxContainer/GridContainer
const BUTTON_SCENE: PackedScene = preload("res://scenes/level_button/level_button.tscn")
const LEVEL_COLS: int = 6
const LEVEL_ROWS: int = 5

func _ready():
	setup_grid()

func setup_grid():
	for level in range(LEVEL_COLS * LEVEL_ROWS):
		var lbs = BUTTON_SCENE.instantiate()
		lbs.set_level_number(str(level+1))
		grid_container.add_child(lbs)
