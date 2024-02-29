extends Control

const MAIN = preload("res://scenes/main/main.tscn")

@onready var level_label = $MarginContainer/VB/LevelLabel
@onready var attempts_label = $MarginContainer/VB/AttemptsLabel
@onready var go_sound = $GOSound
@onready var vb_2 = $MarginContainer/VB2




func _ready():
	level_label.text = " LEVEL %s" % ScoreManager.get_level_selected()
	update_attempts(0)
	SignalManager.on_score_updated.connect(update_attempts)
	SignalManager.on_level_complete.connect(on_level_complete)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("menu") == true:
		get_tree().change_scene_to_packed(MAIN)

func update_attempts(attempts: int):
	attempts_label.text = "Attempts %s" % attempts

func on_level_complete():
	vb_2.show()
	go_sound.play()
