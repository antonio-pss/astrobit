extends CanvasLayer

@onready var shoot: TouchScreenButton = $Abilities/Shoot/Shoot

func _process(delta: float) -> void:
	if not Globals.enemy_focus.is_empty():
		shoot.show()
	else:
		shoot.hide()
