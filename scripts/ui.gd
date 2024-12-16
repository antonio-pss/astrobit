extends CanvasLayer

@onready var box: HBoxContainer = %Box
@onready var score: Label = $Score/BoxContainer/Label
var coffee_full = load("res://images/coffee/0.png")
	
func _ready() -> void:
	update_life()
	

func update_life() -> void:
	clean_life()
	for index in range(Globals.player_health):
		var coffee_rect = TextureRect.new()
		coffee_rect.texture = coffee_full
		box.add_child(coffee_rect) 

func clean_life() -> void:
	if box.get_child_count() != 0:
		for child in box.get_children():
			child.queue_free()

func update_score() -> void:
	score.text = str(Globals.score)
	
