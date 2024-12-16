extends AnimatedSprite2D

@export var scene: PackedScene = load("res://scenes/end.tscn")
@export var inst: bool = false

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(body, "global_position", global_position, 1)
	tween.tween_property(body, "rotation", 10, 1)
	
	await tween.finished
	if inst:
		get_tree().paused = true
		add_child(scene.instantiate())
	else:
		get_tree().change_scene_to_packed(scene)
