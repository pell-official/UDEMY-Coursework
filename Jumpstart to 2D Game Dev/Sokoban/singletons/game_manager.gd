extends Node

const level_scene: PackedScene = preload("res://scenes/level/level.tscn")
const main_scene: PackedScene = preload("res://scenes/main/main.tscn")
var _level_selected: String

func _ready():
	SignalManager.on_level_selected.connect(on_level_selected)

func on_level_selected(ln: String):
	_level_selected = ln
	get_tree().change_scene_to_packed(level_scene)

func load_main_scene():
	get_tree().change_scene_to_packed(main_scene)

func get_level_selected():
	return _level_selected
