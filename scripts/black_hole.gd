extends AnimatedSprite2D

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(body, "global_position", global_position, 1)
	tween.tween_property(body, "rotation", 10, 1)
