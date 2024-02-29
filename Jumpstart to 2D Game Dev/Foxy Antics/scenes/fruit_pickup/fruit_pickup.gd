extends Area2D

const FRUITS: Array = ["melon", "kiwi", "banana", "cherry"]
const GRAVITY: float = 160.0
const JUMP: float = -60.0
const POINTS: int = 2
@onready var animated_sprite_2d = $AnimatedSprite2D
var _start_y: float
var _speed_y: float = JUMP
var _stopped: bool = false


func _ready():
	_start_y = global_position.y
	animated_sprite_2d.play(FRUITS.pick_random())

func _process(delta):
	if _stopped == true:
		return
	position.y += _speed_y * delta
	_speed_y += GRAVITY * delta
	if global_position.y > _start_y:
		_stopped = true

func _on_life_timer_timeout():
	kill_me()

func kill_me():
	set_process(false)
	hide()
	queue_free()


func _on_area_entered(area):
	SignalManager.on_pickup_hit.emit(POINTS)
	kill_me()
