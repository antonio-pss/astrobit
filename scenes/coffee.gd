extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Globals.player_health += 1
	queue_free()
