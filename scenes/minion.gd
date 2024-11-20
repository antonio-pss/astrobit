extends PathFollow2D

@onready var marker: Marker2D = $Marker2D
@onready var timer: Timer = $LaserTimer

var laser_scene: PackedScene = preload("res://scenes/laser.tscn")
var can_laser: bool = true
var speed: int = 150



func _process(delta: float) -> void:
	
	
	$Sprite2D.look_at(get_global_mouse_position())
	progress += speed * delta
	if Input.is_action_just_pressed('primary') and can_laser:
		var laser = laser_scene.instantiate() as Area2D
		laser.position = marker.global_position
		laser.direction = self.scale.x
		laser.scale.x = self.scale.x
		get_parent().add_child(laser)
		can_laser = false
		timer.start()
	if Input.is_action_just_pressed("left"):
		scale.x = abs(scale.x) * -1
		speed = abs(speed)
	if Input.is_action_just_pressed("right"):
		scale.x = abs(scale.x)
		speed = abs(speed) * -1


func _on_laser_timer_timeout() -> void:
	can_laser = true
