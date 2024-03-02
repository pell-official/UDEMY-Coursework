extends Control

@onready var record_label = $TextureRect/MC/NP/MarginContainer/VBoxContainer/RecordLabel


func _ready():
	pass

func _process(delta):
	pass

func new_game():
	hide()
	record_label.hide()

func game_over(level: String, moves: int):
	show()
	if ScoreSync.score_is_new_best(level, moves) == true:
		record_label.show()
