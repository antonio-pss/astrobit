extends CanvasLayer

@onready var life: Label = $MarginContainer/Label

func _ready() -> void:
	pass
	
	
func update_life() -> void:
	life.text = str(Globals.player_health)
	
func coffee() -> void:
	for index in range(Globals.player_health):
		pass
