extends CanvasLayer

@export var text: String = "Obrigado por Jogar"


func _ready() -> void:
	UI.hide()
	MobileUI.hide()
	$"VBoxContainer/Pontuação".text = "Pontuação: " + str(Globals.score)
	$VBoxContainer/Label.text = text
	Globals.pausable = false
	get_tree().paused = true
	var tween = create_tween()
	tween.tween_property($ColorRect, "color", Vector4(0, 0, 0, 1), 2)


func _on_resume_pressed() -> void:
	Globals.reset(false)


func _on_entrar_pressed() -> void:
	hide()
	Globals.login()
