extends StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "jump_height" in body:
		body.velocity.y = -600
