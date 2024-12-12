extends Area2D


func _on_body_entered(body: Node2D) -> void:
	for node in body.get_children():
		if node.is_class("Path2D"):
			for child in node.get_children():
				if child.is_class("PathFollow2D"):
					child.show()
					queue_free()
