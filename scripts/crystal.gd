extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionPolygon2D = $CollisionPolygon2D

var active: bool = false
var speed: int = 100
var vulnerable: bool = true
var player_near: bool = false 
var health = 4

func hit():
	if vulnerable and health > 0:
		vulnerable = false
		$HitTimer.start()
		health -= 1
		sprite.play("damage")
	if health == 0:
		Globals.score += 50
		vulnerable = false
		sprite.play("death")
		speed = 0
		await sprite.animation_finished
		queue_free()
		

func _process(delta: float) -> void:
	if active:
		var direction = (Globals.player_pos - position).normalized()
		position += direction * speed * delta
		turn(direction.x)
	

func turn(direction) -> void:
	if direction > 0:
		sprite.scale.x = -1
		collision.scale.x = -1
	if direction < 0:
		sprite.scale.x = 1
		collision.scale.x = 1

func _on_notice_area_2d_body_entered(_body: Node2D) -> void:
	active = true
	$AnimatedSprite2D.play("walk")


func _on_notice_area_2d_body_exited(_body: Node2D) -> void:
	active = false
	$AnimatedSprite2D.stop()

func _on_atack_area_2d_body_entered(_body: Node2D) -> void:
	player_near = true
	$AnimatedSprite2D.play("attack")


func _on_atack_area_2d_body_exited(_body: Node2D) -> void:
	player_near = false


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == 'damage':
		sprite.animation = "attack"

func _on_attack_timer_timeout() -> void:
	$AnimatedSprite2D.play("atack")


func _on_hit_timer_timeout() -> void:
	vulnerable = true


func _on_body_entered(body: Node2D) -> void:
	print(body)
	body.hit()
