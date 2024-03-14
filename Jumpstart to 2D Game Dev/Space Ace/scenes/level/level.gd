extends Node2D



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE) == true:
		GameManager.load_main_scene()	
	if Input.is_action_just_pressed("TEST") == true:
		ObjectMaker.create_powerup(Vector2(200,200), GameData.POWERUP_TYPE.SHIELD)
