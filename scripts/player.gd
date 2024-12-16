extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Bit
@onready var collision: CollisionShape2D = $CollisionShape2D

@export var start_speed = 200.0
@export var speed = 200.0
@export var jump_height = -400.0

var t_name: String:
	set(value):
		t_name = value
		$Node2D/Label.text = t_name
		
var vunerable: bool = true
var death_scene: PackedScene = load("res://scenes/death_scene.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		sprite.flip_h = true
		
	if Input.is_action_just_pressed("right"):
		sprite.flip_h = false

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_height

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	animation()		
	move_and_slide()
	Globals.player_pos = global_position

func animation():
	if velocity.y != 0:
		sprite.play('jump')
	elif velocity.x != 0:
		sprite.play('walk')
	else:
		sprite.play('idle')

func hit():
	if vunerable:
		Globals.player_health -= 1
		if Globals.player_health != 0:
			vunerable = false
			sprite.play("death")
			get_tree().paused = true
			await sprite.animation_finished
			get_tree().paused = false
			global_position = Globals.spawnpoint
			vunerable = true
		else: 
			sprite.play("death")
			await sprite.animation_finished
			get_tree().paused = true
			add_child(death_scene.instantiate())


			
