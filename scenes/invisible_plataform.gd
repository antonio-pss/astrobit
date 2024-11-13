extends StaticBody2D


func _on_area_2d_body_entered(_body: Node2D) -> void:
	create_tween().tween_property($Sprite2D, "modulate:a", 1, 0.5)
	
