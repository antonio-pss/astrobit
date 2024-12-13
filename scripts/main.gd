extends Node2D
class_name LevelParent

@onready var player: CharacterBody2D = $Player
@onready var initial_spawn: Marker2D = $Objects/Checkpoints/InitialSpawn

var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var coin_scene: PackedScene = load("res://scenes/coin.tscn")

func _ready() -> void:
	UI.show()
	Globals.spawnpoint = initial_spawn.global_position
	%Minion.connect("laser", create_laser)




func _on_bottom_body_entered(_body: Node2D) -> void:
	Globals.player_health -= 1
	player.global_position = Globals.spawnpoint
	

func create_laser(pos):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = Vector2(Globals.enemy_focus.global_position - pos).normalized()
	add_child(laser)

	
