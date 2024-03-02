extends CanvasLayer

@onready var labelhighscore = $VB/Highscore

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	labelhighscore.text = "High Score: " + str(ScoreManager.get_high_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("jump") == true:
		GameManager.load_next_level_scene()
