extends Node

var player_health = 5:
	set(value):
		player_health = value
		UI.update_life()
		UI.add_life()
		
var current_level: PackedScene

var spawnpoint: Vector2

var score: int:
	set(value):
		score = value
		UI.update_score()
