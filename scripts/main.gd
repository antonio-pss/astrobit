extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var initial_spawn: Marker2D = $Objects/Checkpoints/InitialSpawn
var resource = load("res://dialogue/start.dialogue")
var dialogue = DialogueManager

func _ready() -> void:
	UI.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Globals.spawnpoint = initial_spawn.global_position
	dialogue.dialogue_ended.connect(_on_dialogue_ended)
	show_dialogue('movement_tutorial')
	

func _on_bottom_body_entered(_body: Node2D) -> void:
	Globals.player_health -= 1
	player.global_position = Globals.spawnpoint
	

func show_dialogue(title: String) -> void:
	#get_tree().paused = true
	var dialogue_line = await DialogueManager.get_next_dialogue_line(resource, title)
	dialogue_line.show_dialogue_balloon(resource)
	

func _on_dialogue_ended() -> void:
	pass
	
