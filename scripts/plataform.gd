extends PathFollow2D


@export var speed: float = 50	

func _process(delta: float) -> void:
	progress += speed * delta
	
	if 	progress_ratio == 1:
		speed *= -1
	elif progress_ratio == 0:
		speed *= -1
