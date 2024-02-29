extends Control

@onready var scorelabel = $MarginContainer/scorelabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_score_updated.connect(on_score_updated)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_score_updated():
	scorelabel.text = str(ScoreManager.get_score())
