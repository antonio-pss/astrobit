extends Area2D

var tween = create_tween()


func _ready() -> void:
	start_animation()

func start_animation() -> void:
	var start_position = position
	var end_position = position + Vector2(0, -20)
	
	
	tween.tween_property($AnimatedSprite2D, "position", end_position, 1)
	tween.connect('finished', _on_tween_finished)


func _on_tween_finished() -> void:
	var end_position
	if  $AnimatedSprite2D.position.y < 0:
		end_position = position + Vector2(0, 20)
	else:
		end_position = position + Vector2(0, -20)
	
	tween.tween_property($AnimatedSprite2D, "position", end_position, 1)



func _on_body_entered(body: Node2D) -> void:
	for node in body.get_children():
		if node.is_class("Path2D"):
			for child in node.get_children():
				if child.is_class("PathFollow2D"):
					child.show()
					queue_free()
