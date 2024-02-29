extends Control

@onready var h_score = $MarginContainer/HighScore

# Called when the node enters the scene tree for the first time.
func _ready():
	h_score.text = str(ScoreManager.get_high_score())
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly") == true:
		GameManager.load_game_scene()
