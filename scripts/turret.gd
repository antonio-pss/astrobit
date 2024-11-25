extends StaticBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var marker: Marker2D = $Marker2D
@onready var timer: Timer = $LaserTimer


var laser_scene: PackedScene = preload("res://scenes/laser.tscn")
var can_laser: bool = true


func _process(_delta: float) -> void:
	if can_laser:
		var laser = laser_scene.instantiate() as Area2D
		laser.position = marker.global_position
		laser.direction = self.scale.x
		laser.scale.x = self.scale.x
		get_parent().add_child(laser)
		can_laser = false
		timer.start()
		
	
func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_hit_box_body_entered(_body: Node2D) -> void:
	can_laser = false
	$AnimatedSprite2D.play("correct")
	timer.stop()
