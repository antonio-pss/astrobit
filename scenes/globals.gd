extends Node

var player_health = 10:
	set(value):
		player_health = value
		UI.update_life()
		
var current_level: PackedScene

var spawnpoint: Vector2
