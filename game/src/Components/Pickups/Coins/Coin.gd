extends Area2D



func _on_Area2D_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.name == "Player":
		self.queue_free()
		Global.SCORE += 2
