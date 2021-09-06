extends Area2D



func _on_Heart_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.name == "Player" and Global.CURRENT_HEALTH < Global.TOTAL_HEALTH:
		self.queue_free()
		Global.CURRENT_HEALTH += 1
