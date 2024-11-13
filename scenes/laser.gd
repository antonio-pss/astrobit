extends Area2D

var speed: int = -200

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	
func _on_body_entered(body: Node2D) -> void:
	body.hit()
	queue_free()
