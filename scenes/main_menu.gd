extends CanvasLayer

var btn_focus = load("res://images/buttons/1.png")
var btn_normal = load("res://images/buttons/0.png")

func _ready() -> void:
	UI.hide()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_phases_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/phases_menu.tscn")


func _on_quit_pressed() -> void:
	Globals.quit()
