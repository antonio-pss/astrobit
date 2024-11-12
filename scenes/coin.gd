extends Area2D	

func _on_body_entered(_body: Node2D) -> void:
	Globals.score += 10
	queue_free()
