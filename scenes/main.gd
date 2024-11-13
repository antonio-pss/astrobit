extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var initial_spawn: Marker2D = $Objects/Checkpoints/InitialSpawn

var pause_scene: PackedScene = load("res://scenes/pause_menu.tscn")

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Globals.spawnpoint = initial_spawn.global_position
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		add_child(pause_scene.instantiate())
		

func _on_bottom_body_entered(_body: Node2D) -> void:
	Globals.player_health -= 1
	player.global_position = Globals.spawnpoint
	
	
