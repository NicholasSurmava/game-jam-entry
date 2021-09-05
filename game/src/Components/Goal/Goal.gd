extends Area2D



func _on_Goal_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.name == "Player":
		print("Level complete!")
