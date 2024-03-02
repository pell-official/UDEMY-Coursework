extends Node2D

@onready var player_cam = $PlayerCam
@onready var player = $Player


func _ready():
	get_tree().paused = false


func _process(delta):
	player_cam.position = player.position
	#if Input.is_action_just_pressed("left") == true:
		#GameManager.load_main_scene()
	#if Input.is_action_just_pressed("right") == true:
		#GameManager.load_next_level_scene()
