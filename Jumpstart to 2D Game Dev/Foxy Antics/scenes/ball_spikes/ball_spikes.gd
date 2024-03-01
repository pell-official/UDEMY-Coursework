extends PathFollow2D

@export var speed: float = 0.5



func _process(delta):
	progress_ratio = progress_ratio + delta * speed
