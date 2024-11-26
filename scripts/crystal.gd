extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var active: bool = false
var speed: int = 100
var vulnerable: bool = true
var player_near: bool = false 

var health = 5

func hit():
	if vulnerable:
		vulnerable = false
		$HitTimer.start()
		health -= 10
	if health <= 0:
		await sprite.play("death")
		queue_free()
		

func _process(delta: float) -> void:
	var direction = (Globals.player_pos - position).normalized()
	velocity = direction * speed
	if active:
		move_and_slide()
		look_at(Globals.player_pos)

func _on_notice_area_2d_body_entered(_body: Node2D) -> void:
	active = true
	$AnimatedSprite2D.play("walk")


func _on_notice_area_2d_body_exited(_body: Node2D) -> void:
	active = false
	$AnimatedSprite2D.stop()

func _on_atack_area_2d_body_entered(_body: Node2D) -> void:
	player_near = true
	$AnimatedSprite2D.play("atack")


func _on_atack_area_2d_body_exited(_body: Node2D) -> void:
	player_near = false


func _on_animated_sprite_2d_animation_finished() -> void:
	if player_near and sprite.animation == 'attack':
		Globals.player_health -= 1
		$AttackTimer.start()


func _on_attack_timer_timeout() -> void:
	$AnimatedSprite2D.play("atack")


func _on_hit_timer_timeout() -> void:
	vulnerable = true
