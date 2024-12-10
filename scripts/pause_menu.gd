extends CanvasLayer

var btn_focus = load("res://images/medium_hover.png")
var btn_normal = load("res://images/medium_normal.png")

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		Globals.resume()

func _on_resume_pressed() -> void:
	Globals.resume()

func _on_restart_pressed() -> void:
	Globals.restart()

func _on_quit_pressed() -> void:
	Globals.quit()
	
