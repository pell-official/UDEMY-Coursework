extends Camera2D

@onready var timer = $Timer
const SHAKE_RANGE: Vector2 = Vector2(-5.0, 5.0)
var _shake_offset: Vector2 = Vector2.ZERO 

func _ready():
	_shake_offset = offset
	SignalManager.on_player_hit.connect(on_player_hit)
	set_process(false)

func _process(delta):
	offset = Vector2(_shake_offset.x + get_random_shake_amt(), _shake_offset.y + get_random_shake_amt())

func get_random_shake_amt():
	return randf_range(SHAKE_RANGE.x, SHAKE_RANGE.y)

func _on_timer_timeout():
	set_process(false)
	_shake_offset = offset

func on_player_hit(_v:int):
	set_process(true)
	timer.start()
