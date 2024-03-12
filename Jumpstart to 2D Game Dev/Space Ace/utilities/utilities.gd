class_name Utilities

static func set_and_start_timer(timer:Timer, target:float, variance:float):
	timer.wait_time = randf_range(target-variance, target+variance)
	timer.start()
