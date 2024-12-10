extends CanvasLayer


func _ready() -> void:
	var tween = create_tween()
	print($ColorRect.color)
	tween.tween_property($ColorRect, "color", Vector4(0, 0, 0, 1), 2)
	print($ColorRect.color)
