extends "res://src/Components/Actor.gd"

#const bulletPath = preload("res://src/Components/Bullet/Bullet.tscn")
#
#export (int) var SPEED = 300
#export (int) var GRAVITY = 2000
#export (int) var JUMP_FORCE = -850
#
#var velocity = Vector2.ZERO
#
#func _ready():
#	print(self.name)
#
#func _physics_process(delta: float) -> void:
#	var direction = Vector2.ZERO
#
#	# get direction pressed, left or right.
#	direction = sign(Input.get_action_strength("right") - Input.get_action_strength("left"))
#	velocity.x = direction * SPEED
#
#	if Input.is_action_just_pressed("jump"):
#		if is_on_floor():
#			velocity.y = JUMP_FORCE
#
#	if Input.is_action_just_released("jump"):
#		if velocity.y < -100:
#			velocity.y = -100
#
#	if direction > 0:
#		$AnimatedSprite.flip_h = false
#	elif direction < 0:
#		$AnimatedSprite.flip_h = true
#
#	if Input.is_action_just_pressed("shoot"):
#		$AnimatedSprite.set_frame(2)
#		print("SHOOT")
#
#		var bullet = bulletPath.instance()
#		get_parent().add_child(bullet)
#		bullet.position = self.global_position
#
#		if $AnimatedSprite.flip_h == false:
#			bullet.direction.x = 1
#		else:
#			bullet.direction.x = -1
#	else:
#		$AnimatedSprite.set_frame(0)
#
#	velocity.y += GRAVITY * delta
#
#	velocity = move_and_slide(velocity, Vector2.UP)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("quack"):
		$dialogue.text = "quack"
		$dialogue.visible = true
		$dialogue_timer.wait_time = 1
		$dialogue_timer.start()

func _on_Start_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.name == "Player":
		get_tree().change_scene("res://src/Core/Levels/Level1/Level1.tscn")


func _on_dialogue_timer_timeout() -> void:
	$dialogue.text = ""
	$dialogue.visible = false
	print("changing level")


func _on_Quit_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.name == "Player":
		get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
