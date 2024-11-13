extends ColorRect

var btn_focus = load("res://images/buttons/1.png")

#func _ready() -> void:
	#for button in get_tree().get_nodes_in_group('buttons'):
		#button.connect('mouse_entered', _on_button_mouse_entered)
		#
#
#func _on_button_mouse_entered():
	#pass


func _on_resume_mouse_entered() -> void:
	$VBoxContainer/Resume.icon = btn_focus
