extends Node2D

@export var pipes_scene: PackedScene
@onready var obsholder = $obsholder
@onready var spawn_u = $spawnU
@onready var spawn_l = $spawnL
@onready var spawntimer = $spawntimer
@onready var plane = $plane


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(_on_plane_died)
	ScoreManager.set_score(0)
	randomize()
	spawn_pipes()

func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var y_pos = randf_range(spawn_u.position.y, spawn_l.position.y)
	new_pipes.position = Vector2(spawn_u.position.x, y_pos)
	obsholder.add_child(new_pipes)


func _on_spawntimer_timeout():
	spawn_pipes()

func stop_pipes():
	spawntimer.stop()
	for pipe in obsholder.get_children():
		pipe.set_process(false)

func _on_plane_died():
	stop_pipes()
