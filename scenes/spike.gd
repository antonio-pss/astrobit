extends StaticBody2D


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	Globals.player_health -= 1
	body.velocity.y = -200

	
