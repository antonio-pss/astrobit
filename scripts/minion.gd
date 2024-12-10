extends PathFollow2D

@onready var marker: Marker2D = $Marker2D
@onready var timer: Timer = $LaserTimer
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

signal laser(pos)

var laser_scene: PackedScene = preload("res://scenes/laser.tscn")
var can_laser: bool = true
var enemy_nearby: bool = false
var speed: int = 150


func _process(delta: float) -> void:
	
	progress += speed * delta
	if Input.is_action_just_pressed('primary') and can_laser and enemy_nearby:
		laser.emit(marker.global_position)
		sprite.animation = "shoot"
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
	sprite.animation = "danger"
	
func _on_attack_area_area_exited(_area: Area2D) -> void:
	enemy_nearby = false
	Globals.enemy_focus = null
	sprite.animation = "walk"
