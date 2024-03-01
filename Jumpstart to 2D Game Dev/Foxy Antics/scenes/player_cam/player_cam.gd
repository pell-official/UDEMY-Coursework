extends Camera2D

@export var shake_amount: float = 5.0
@onready var shake_timer = $ShakeTimer

func _ready():
	set_process(false)
	SignalManager.on_player_hit.connect(on_player_hit)

func get_random_offset() -> Vector2:
	return Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))

func shake():
	set_process(true)
	shake_timer.start()

func on_player_hit(_lives: int):
	shake()


func _process(delta):
	offset = get_random_offset()


func _on_shake_timer_timeout():
	set_process(false)
	offset = Vector2.ZERO
