extends PathFollow2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var speed: float = -50	

func _process(delta: float) -> void:
	progress += speed * delta
	
	if 	progress_ratio == 1:
		sprite.flip_h = true
		speed *= -1
	elif progress_ratio == 0:
		sprite.flip_h = false
		speed *= -1
