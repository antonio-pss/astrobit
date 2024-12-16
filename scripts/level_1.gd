extends LevelParent

func _on_area_2d_body_entered(_body: Node2D) -> void:
	create_tween().tween_property($Player/Camera2D, "zoom", Vector2(2.5, 2.5), 2)
