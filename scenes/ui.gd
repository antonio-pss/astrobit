extends CanvasLayer

@onready var score: Label = $Score/BoxContainer/Label
var lifes = []
var coffee_full = load("res://images/coffee/0.png")
var coffee_empty = load("res://images/coffee/1.png")
	
func _ready() -> void:
	for index in range(Globals.player_health):
		var coffee_rect = TextureRect.new()
		coffee_rect.texture = coffee_full
		lifes.append(coffee_rect)
		$Life/HBoxContainer.add_child(coffee_rect)
		
				
func update_life() -> void:
	for index in range(lifes.size()):
		if index + 1 > Globals.player_health:
			lifes[index].texture = coffee_empty
			
func add_life() -> void:
	if Globals.player_health > lifes.size():
		var coffee_rect = TextureRect.new()
		coffee_rect.texture = coffee_full
		lifes.append(coffee_rect)
		$Life/HBoxContainer.add_child(coffee_rect)

	
func update_score() -> void:
	score.text = str(Globals.score)
	
