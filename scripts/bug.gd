extends PathFollow2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var speed: float = -50	

func _process(delta: float) -> void:
	progress += speed * delta
	
	if 	progress_ratio == 1:
		sprite.flip_h = true
		speed *= -1
	elif progress_ratio == 0: 
		sprite.flip_h = false
		speed *= -1


func _on_hit_box_body_entered(body: Node2D) -> void:
	body.velocity.y = -300
	sprite.play('death')
	speed = 0
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == 'death':
		sprite.play('explosion')
		sprite.scale = Vector2(0.3, 0.3)
	elif sprite.animation == "explosion":
		queue_free()


func _on_damage_box_body_entered(body: Node2D) -> void:
	body.hit()
