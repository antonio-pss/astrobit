extends StaticBody2D


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	body.hit()
	body.velocity.y = -200

	
