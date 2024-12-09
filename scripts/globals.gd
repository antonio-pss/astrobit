extends Node

var player_health = 5:
	set(value):
		player_health = value
		UI.update_life()
		UI.add_life()

var player_pos: Vector2

var spawnpoint: Vector2

var enemy_focus: Area2D

var score: int:
	set(value):
		score = value
		UI.update_score()

var paused: bool = false



func resume():
	paused = !paused
	if paused:
		get_tree().paused = true
		PauseMenu.show()
	else:
		get_tree().paused = false
		PauseMenu.hide()
	
func restart():
	score = 0
	player_health = 5
	get_tree().reload_current_scene()
	
func quit():
	get_tree().quit()
