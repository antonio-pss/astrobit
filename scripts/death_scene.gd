extends CanvasLayer

func _ready() -> void:
	Globals.pausable = false
	UI.hide()
	MobileUI.hide()

func _on_resume_pressed() -> void:
	Globals.reset()
	
func _on_quit_pressed() -> void:
	Globals.quit()
