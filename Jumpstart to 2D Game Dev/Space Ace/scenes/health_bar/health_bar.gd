extends TextureProgressBar

signal died
@export var level_low: int = 30
@export var level_med: int = 65
@export var start_health: int = 100
const COLOR_DANGER: Color = Color("#cc0000")
const COLOR_MIDDLE: Color = Color("#ff9900")
const COLOR_GOOD: Color = Color("#33CC33")

func _ready():
	max_value = start_health
	value = start_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_color()

func set_color():
	if value < level_low:
		tint_progress = COLOR_DANGER
	if value >= level_low and value < level_med:
		tint_progress = COLOR_MIDDLE
	else:
		tint_progress = COLOR_GOOD

func inc_value(v:int):
	value += v
	if value <= 0:
		died.emit()
	set_color()

func take_damage(v:int):
	inc_value(-v)
