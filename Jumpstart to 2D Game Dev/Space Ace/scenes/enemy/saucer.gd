extends PathFollow2D


var missile_scene: PackedScene = preload("res://scenes/homing_missile/homing_missile.tscn")


@onready var state_machine = $AnimationTree["parameters/playback"]
@onready var booms = $Booms


const SPEED: float = 0.03
const SHOOT_PROGRESS: float = 0.02
const FIRE_OFFSETS = [0.25, 0.5, 0.75]
const BOOM_DELAY: float = 0.15
const HIT_DAMAGE: int = 5
const SCORE: int = 150


var _shooting: bool = false
var _shots_fired: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	progress_ratio = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _shooting == false:
		progress_ratio += SPEED * delta
		try_shoot()
	

func update_shots_fired() -> void:
	_shots_fired += 1
	if _shots_fired >= len(FIRE_OFFSETS):
		_shots_fired = 0


func try_shoot() -> void:
	if abs(progress_ratio - FIRE_OFFSETS[_shots_fired]) < SHOOT_PROGRESS:
		state_machine.travel("shoot")
		update_shots_fired()

	
func set_shooting(v: bool) -> void:
	_shooting = v
	

func shoot() -> void:
	var missile = missile_scene.instantiate()
	get_tree().current_scene.add_child(missile)
	missile.global_position = global_position
	

func die() -> void:
	queue_free()


func make_booms() -> void:
	for b in booms.get_children():
		ObjectMaker.create_boom(b.global_position)
		await get_tree().create_timer(BOOM_DELAY).timeout





