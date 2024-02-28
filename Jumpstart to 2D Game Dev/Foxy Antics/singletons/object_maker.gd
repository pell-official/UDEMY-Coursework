extends Node

enum BULLET_KEY {PLAYER, ENEMY}
const BULLETS = {
	BULLET_KEY.PLAYER: preload("res://scenes/bullets/bulletplayer/bullet_player.tscn"),
	BULLET_KEY.ENEMY: preload("res://scenes/bullets/bulletenemy/bullet_enemy.tscn")
}
const EXPLOSION_SCENE: PackedScene = preload("res://scenes/explosion/enemy_explosion.tscn")

func add_child_deferred(child_to_add):
	get_tree().root.add_child(child_to_add)

func call_add_child(child_to_add):
	call_deferred("add_child_deferred", child_to_add)

func create_bullet(speed: float, direction: Vector2, start_pos: Vector2, life_span: float, key: BULLET_KEY):
	var new_b = BULLETS[key].instantiate()
	new_b.setup(direction, life_span, speed)
	new_b.global_position = start_pos
	call_add_child(new_b)

func create_explosion(start_pos: Vector2):
	var new_exp = EXPLOSION_SCENE.instantiate()
	new_exp.global_position = start_pos
	call_add_child(new_exp)