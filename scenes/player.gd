extends CharacterBody2D
class_name Player

@onready var sprite: AnimatedSprite2D = $Bit
@onready var collision: CollisionShape2D = $CollisionShape2D

@export var speed = 200.0
@export var jump_height = -400.0

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

func animation():
	if velocity.y != 0:
		sprite.play('jump')
	elif velocity.x != 0:
		sprite.play('walk')
	else:
		sprite.play('idle')
