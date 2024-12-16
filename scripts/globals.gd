extends Node

var player_health: int = 5:
	set(value):
		player_health = value
		UI.update_life()

var player: Player
var player_pos: Vector2

var spawnpoint: Vector2

var cores: int = 5

var enemy_focus = []

var score: int:
	set(value):
		score = value
		UI.update_score()

var paused: bool = false
var pausable: bool = true

func _ready() -> void:
	enemy_focus = []

func resume():
	if pausable:
		paused = !paused
		if paused:
			get_tree().paused = true
			PauseMenu.show()
		else:
			get_tree().paused = false
			PauseMenu.hide()
	
func restart():
	player.global_position = spawnpoint
	resume()
	

func reset(delete_score: bool = true):
	MobileUI.show()
	UI.show()
	pausable = true
	if delete_score:
		score = 0
	player_health = 5
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	resume()
		

	
func login():
	PauseMenu.hide()
	LoginMenu.show()

func quit():
	get_tree().quit()
