extends StaticBody2D

var speed: int = 100
var direction: Vector2 = Vector2.LEFT

func _physics_process(delta: float) -> void:
	position.x += speed * delta * direction.x
