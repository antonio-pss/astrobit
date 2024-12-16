extends Area2D

func _ready() -> void:
	animation1()

func animation1():
	$AnimatedSprite2D.flip_h = false
	var tween = create_tween().tween_property(self, "global_position", global_position + Vector2(-10 , 10), 1)
	await tween.finished
	tween = create_tween().tween_property(self, "global_position", global_position + Vector2(-10 , -10), 1)
	await tween.finished
	animation2()
	
func animation2():
	$AnimatedSprite2D.flip_h = true
	var tween = create_tween().tween_property(self, "global_position", global_position + Vector2(10 , 10), 1)
	await tween.finished
	tween = create_tween().tween_property(self, "global_position", global_position + Vector2(10 , -10), 1)
	await tween.finished
	animation1()
	

func _on_body_entered(body: Node2D) -> void:
	for node in body.get_children():
		if node.is_class("Path2D"):
			for child in node.get_children():
				if child.is_class("PathFollow2D"):
					child.show()
					queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("shoot")
