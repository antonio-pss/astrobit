extends Area2D

var speed: int = 0

func _physics_process(delta: float) -> void:
	position.y += speed * delta

func _on_body_entered(body: Node2D) -> void:
	body.hit()

func _on_view_box_body_entered(_body: Node2D) -> void:
	speed = 200
	await get_tree().create_timer(5).timeout
	queue_free()


	
