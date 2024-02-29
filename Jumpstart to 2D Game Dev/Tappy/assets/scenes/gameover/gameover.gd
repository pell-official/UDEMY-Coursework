extends Control

@onready var go_label = $go_label
@onready var spacelabel = $spacelabel
@onready var timer = $Timer
@onready var crash_sound = $crash_sound



# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spacelabel.visible == true and Input.is_action_just_pressed("fly") == true:
		GameManager.load_main_scene()
	
func run_sequence() -> void:
	go_label.hide()
	spacelabel.show()
	
func on_plane_died():
	crash_sound.play()
	show()
	timer.start()

func _on_timer_timeout():
	run_sequence()
