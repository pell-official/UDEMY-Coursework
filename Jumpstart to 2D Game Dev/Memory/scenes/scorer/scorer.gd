extends Node

class_name Scorer
@onready var sound = $Sound
@onready var reveal_timer = $RevealTimer
var _selections: Array = []
var _target_pairs: int = 0
var _moves_made: int = 0
var _pairs_made: int = 0

func _ready():
	SignalManager.on_tile_selected.connect(on_tile_selected)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)

func _process(delta):
	pass

func get_moves_made_str() -> String:
	return str(_moves_made)

func get_pairs_made_str() -> String:
	return "%s / %s" % [_pairs_made, _target_pairs]

func clear_new_game(target_pairs: int) -> void:
	_selections.clear()
	_pairs_made = 0
	_moves_made = 0
	_target_pairs = target_pairs

func kill_tiles() -> void:
	for s in _selections:
		s.kill_on_success()
	_pairs_made += 1
	SoundManager.play_sound(sound, SoundManager.SOUND_SUCCESS)

func selections_are_pair() -> bool:
	return (
		_selections[0].get_instance_id() != _selections[1].get_instance_id()
		and
		_selections[0].get_item_name() == _selections[1].get_item_name()
		)

func update_selections():
	reveal_timer.start()
	if selections_are_pair() == true:
		kill_tiles()

func check_pair_made(tile: MemoryTile):
	tile.reveal(true)
	_selections.append(tile)
	if _selections.size() != 2:
		return
	SignalManager.on_selection_disabled.emit()
	_moves_made += 1
	update_selections()

func hide_selections() -> void:
	for s in _selections:
		s.reveal(false)

func check_game_over() -> void:
	if _pairs_made >= _target_pairs:
		SignalManager.on_game_over.emit(_moves_made)

func on_tile_selected(tile: MemoryTile):
	SoundManager.play_tile_click(sound)
	check_pair_made(tile)

func _on_reveal_timer_timeout():
	if selections_are_pair() == false:
		hide_selections()
	_selections.clear()
	check_game_over()
	SignalManager.on_selection_enabled.emit()

func on_game_exit_pressed():
	reveal_timer.stop()
