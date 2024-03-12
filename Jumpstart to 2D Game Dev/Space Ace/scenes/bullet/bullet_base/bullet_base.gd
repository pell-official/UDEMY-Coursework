extends Area2D

var _direction: Vector2 = Vector2.UP
var _speed: float = 200.0
var _damage: int = 10

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += _direction * _speed * delta

func setup(pos:Vector2, dir:Vector2, sp:float, dmg:int):
	_direction = dir
	_speed = sp
	_damage = dmg
	global_position = pos

func _on_screen_exited():
	queue_free()

func blow_up(area:Node2D):
	var net_position = global_position - area.global_position
	ObjectMaker.create_explosion(net_position, area)
	set_process(false)
	queue_free()

func _on_area_entered(area):
	blow_up(area)