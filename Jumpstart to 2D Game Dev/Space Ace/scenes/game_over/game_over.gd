extends Control

@onready var score_label = $VB/ScoreLabel
@onready var timer = $Timer
var _can_shoot: bool = false

func _ready():
	hide()
	SignalManager.on_player_died.connect(on_player_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _can_shoot == true and Input.is_action_just_pressed("shoot") == true:
		GameManager.load_main_scene()


func _on_timer_timeout():
	_can_shoot = true

func on_player_died():
	show()
	timer.start()
	score_label.text == "Score: %s (Best: %s)" % [ScoreManager.get_score(), ScoreManager.get_high_score()]
