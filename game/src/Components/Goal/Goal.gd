extends Area2D

export (String) var switch_to = null

func _on_Goal_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.name == "Player":
		if switch_to != null:
			get_tree().change_scene(switch_to)
		else:
			print("No scene to switch to!!!!")
