extends CanvasLayer

var btn_focus = load("res://images/buttons/1.png")
var btn_normal = load("res://images/buttons/0.png")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		Globals.resume()

func _on_resume_pressed() -> void:
	Globals.resume()

func _on_restart_pressed() -> void:
	Globals.restart()

func _on_quit_pressed() -> void:
	Globals.quit()
	
