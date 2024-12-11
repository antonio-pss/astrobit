extends Area2D

var speed: int = 200
var direction: Vector2 = Vector2.LEFT

func _ready() -> void:
	await get_tree().create_timer(2).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	position += speed * delta * direction
	
	
func _on_body_entered(body: Node2D) -> void:
	if "hit" in body:
		body.hit()
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if "hit" in area:
		area.hit()
	queue_free()
