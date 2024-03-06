extends PathFollow2D

@export var _shoots: bool = false
@export var aims_at_player: bool = false
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var laser_timer = $LaserTimer
@onready var booms = $Booms
var _player_ref: Player
var _speed: float = 0.0
var _can_shoot: bool = false
var _dead: bool = false
var _anim_string: String

func _ready():
	_player_ref = get_tree().get_first_node_in_group(GameData.GROUP_PLAYER)
	if !_player_ref:
		queue_free()
	animated_sprite_2d.play(_anim_string)

func setup(speed: float, anim_name: String):
	_speed = speed
	_anim_string = anim_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += _speed * delta
	if progress_ratio > 0.99:
		queue_free()


func _on_laser_timer_timeout():
	pass # Replace with function body.


func _on_screen_entered():
	pass # Replace with function body.


func _on_screen_exited():
	set_process(false)
	queue_free()


func _on_area_entered(area):
	pass # Replace with function body.
