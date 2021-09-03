extends Area2D

var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	velocity.x = 1
	
	global_position.x += velocity.x
