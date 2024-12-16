extends Area2D

var active: bool = true

func _on_body_entered(_body: Node2D) -> void:
	if active:
		Globals.spawnpoint = global_position
		$AnimatedSprite2D.play("correct")
		active = false
