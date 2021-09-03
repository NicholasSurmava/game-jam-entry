extends Area2D

var velocity = Vector2.ZERO
var direction = Vector2(0,0)

func _physics_process(delta: float) -> void:
	velocity.x = direction.x * 10
	
	global_position.x += velocity.x


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
