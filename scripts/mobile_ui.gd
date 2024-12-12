extends CanvasLayer

func _ready() -> void:
	match OS.get_name():
		"Android", "iOS":
			show()
		_:
			hide()

func _on_left_pressed() -> void:
	Input.action_press("left")


func _on_right_pressed() -> void:
	Input.action_press("right")


func _on_shoot_pressed() -> void:
	Input.action_press("primary")


func _on_jump_pressed() -> void:
	Input.action_press("up")


func _on_menu_pressed() -> void:
	Input.action_press("pause")
