extends Area2D

var speed: int = 200
var direction: int = 1

func _ready() -> void:
	await get_tree().create_timer(2).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	position.x += speed * delta * direction
	
func _on_body_entered(body: Node2D) -> void:
	body.hit()
	queue_free()
