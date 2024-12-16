extends LevelParent

var end_scene: PackedScene = load("res://scenes/end.tscn")

func _process(_delta: float) -> void:
	if Globals.cores == 0:
		UI.hide()
		MobileUI.hide()
		$Player/Camera2D.enabled = false
		$Camera2D.enabled = true
		$Explosion.play("explosition")
		Globals.cores -= 1
		create_tween().tween_property(%Black, "position", $Marker2D.position, 5)
		var t = create_tween().tween_property(%Black, "scale", Vector2(150, 150), 5)
		await t.finished
		add_child(end_scene.instantiate())


	
