extends Node2D

@onready var sound = $Sound

func _ready():
	ScoreManager.reset_score()
	SignalManager.on_player_died.connect(on_player_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE) == true:
		GameManager.load_main_scene()	
	if Input.is_action_just_pressed("TEST") == true:
		ObjectMaker.create_powerup(Vector2(200,200), GameData.POWERUP_TYPE.SHIELD)

func on_player_died():
	sound.stop()
	for node in get_children():
		if is_instance_valid(node) and node.is_class("Node2D"):
			ObjectMaker.create_explosion(node.global_position, self)
			node.queue_free()
