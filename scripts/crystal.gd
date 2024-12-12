extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionPolygon2D = $CollisionPolygon2D

@export var speed: int = 100
@export var current_speed: int = 100

var direction: Vector2 = Vector2.LEFT
var active: bool = false
var vulnerable: bool = true
var player_near: bool = false 
var health = 4


func _process(delta: float) -> void:
	if active:
		if not player_near:
			direction = (Globals.player_pos - position).normalized()
		position += direction * current_speed * delta
		turn(direction.x)


func turn(direction) -> void:
	if direction > 0:
		sprite.scale.x = -1
		collision.scale.x = -1
	if direction < 0:
		sprite.scale.x = 1
		collision.scale.x = 1


func hit():
	if health == 0:
		Globals.score += 50
		health -= 1
		vulnerable = false
		sprite.play("death")
		current_speed = 0
		await sprite.animation_finished
		queue_free()
	elif vulnerable:
		vulnerable = false
		$HitTimer.start()
		health -= 1
		if sprite.animation != "death":
			sprite.play("damage")


func _on_notice_area_2d_body_entered(_body: Node2D) -> void:
	active = true
	if sprite.animation != "death":
		sprite.play("walk")


func _on_notice_area_2d_body_exited(_body: Node2D) -> void:
	active = false
	sprite.stop()

func _on_atack_area_2d_body_entered(_body: Node2D) -> void:
	player_near = true
	if sprite.animation != "death":
		current_speed = 200
		sprite.play("attack")


func _on_atack_area_2d_body_exited(_body: Node2D) -> void:
	player_near = false
	if sprite.animation != "death":
		current_speed = speed


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == 'damage':
		sprite.animation = "attack"

func _on_attack_timer_timeout() -> void:
	if sprite.animation != "death":
		sprite.play("atack")


func _on_hit_timer_timeout() -> void:
	vulnerable = true


func _on_body_entered(body: Node2D) -> void:
	body.hit()
