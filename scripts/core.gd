extends RigidBody2D

var health: int = 2

func hit():
	health -= 1
	if health == 0:
		$AnimatedSprite2D.play("explosion")
		scale = Vector2(0.25, 0.25)
		await $AnimatedSprite2D.animation_finished
		Globals.cores -= 1
		queue_free()
