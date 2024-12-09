extends PathFollow2D

@onready var marker: Marker2D = $Marker2D
@onready var timer: Timer = $LaserTimer

signal laser(pos)

var laser_scene: PackedScene = preload("res://scenes/laser.tscn")
var can_laser: bool = true
var enemy_nearby: bool = false
var speed: int = 150


func _process(delta: float) -> void:
	
	$AnimatedSprite2D.look_at(get_global_mouse_position())
	progress += speed * delta
	if Input.is_action_just_pressed('primary') and can_laser and enemy_nearby:
		var laser = laser_scene.instantiate() as Area2D
		laser.position = marker.global_position
		laser.direction = Vector2.LEFT
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


func _on_attack_area_area_entered(area: Area2D) -> void:
	enemy_nearby = true
	Globals.enemy_focus = area
	
func _on_attack_area_area_exited(_area: Area2D) -> void:
	enemy_nearby = false
	Globals.enemy_focus = null
