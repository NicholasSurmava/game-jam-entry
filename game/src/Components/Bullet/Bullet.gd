extends KinematicBody2D

var velocity = Vector2.ZERO
var direction = Vector2(0,0)

func _physics_process(delta: float) -> void:
	velocity.x = direction.x * 10
	
	self.global_position.x += velocity.x

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_Area2D_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.is_in_group('enemy'):
		Global.SCORE += 5
		body.queue_free()
		self.queue_free()
		
	if body.name == "World":
		self.queue_free()
