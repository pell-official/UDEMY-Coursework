extends Area2D
class_name Player
@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@export var speed: float = 250.0
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 250.0
@export var bullet_damage: int = 10
@export var bullet_direction: Vector2 = Vector2.UP
@export var health_bonus: int = 50
@onready var shield = $Shield
const MARGIN: float = 32.0
var _upper_left: Vector2
var _lower_right: Vector2

func _ready():
	set_limits()
	SignalManager.on_powerup_hit.connect(on_powerup_hit)

func set_limits():
	var vp = get_viewport_rect()
	_lower_right = Vector2(vp.size.x - MARGIN, vp.size.y - MARGIN)
	_upper_left = Vector2(MARGIN, MARGIN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = get_input()
	global_position += input * delta * speed
	global_position = global_position.clamp(_upper_left, _lower_right)
	if Input.is_action_just_pressed("shoot") == true:
		shoot()

func get_input() -> Vector2:
	var v = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if v.x != 0:
		animation_player.play("turn")
		if v.x > 0:
			sprite_2d.flip_h = true
		else:
			sprite_2d.flip_h = false
	else:
		animation_player.play("fly")
	return v.normalized()
	
func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.setup(global_position, bullet_direction, bullet_speed, bullet_damage)
	get_tree().current_scene.add_child(bullet)

func on_powerup_hit(power_up:GameData.POWERUP_TYPE):
	if power_up == GameData.POWERUP_TYPE.SHIELD:
		shield.enable_shield()
	elif power_up == GameData.POWERUP_TYPE.HEALTH:
		SignalManager.on_player_health_bonus.emit(health_bonus)

func _on_area_entered(area):
	if area.is_in_group(GameData.ENEMY_SHIP) == true:
		SignalManager.on_player_hit.emit(GameData.COLLISION_DAMAGE)
	elif area.is_in_group(GameData.GROUP_SAUCER) == true:
		SignalManager.on_player_hit.emit(GameData.COLLISION_DAMAGE)
	elif area.is_in_group(GameData.GROUP_HOMING_MISSILE) == true:
		SignalManager.on_player_hit.emit(GameData.MISSILE_DAMAGE)
	elif area.is_in_group(GameData.ENEMY_BULLET) == true:
		SignalManager.on_player_hit.emit(area.get_damage())
