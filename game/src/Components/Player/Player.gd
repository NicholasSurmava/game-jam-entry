extends Actor

var playing = true

func _process(delta):
	if Global.CURRENT_HEALTH == 0:
		playing = false
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("dead")

func _physics_process(delta: float) -> void:
	# get direction pressed, left or right.
	if playing == true:
		direction = sign(Input.get_action_strength("right") - Input.get_action_strength("left"))
	
	# Apply direction and speed to velocity.
	velocity.x = direction * SPEED
	velocity.y += GRAVITY * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("jump") and playing == true:
		if is_on_floor():
			velocity.y = JUMP_FORCE
	
	if Input.is_action_just_released("jump") and playing == true:
		if velocity.y < -100:
			velocity.y = -100
			
	if direction > 0:
		$AnimatedSprite.flip_h = false
	elif direction < 0:
		$AnimatedSprite.flip_h = true
	
	if Input.is_action_just_pressed("shoot") and playing == true:
		$AnimatedSprite.set_frame(2)
		print("SHOOT")
		
		var bullet = bulletPath.instance()
		get_parent().add_child(bullet)
		bullet.position = self.global_position

		if $AnimatedSprite.flip_h == false:
			bullet.direction.x = 1
		else:
			bullet.direction.x = -1
	else:
		$AnimatedSprite.set_frame(0)
	
	if Input.is_action_just_pressed("quack") and playing == true:
		$dialogue.text = "quack"
		$dialogue.visible = true
		$dialogue_timer.wait_time = 1
		$dialogue_timer.start()

func _on_Start_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.name == "Player":
		print(body.name)
		get_tree().change_scene("res://src/Core/Levels/Level1/Level1.tscn")

func _on_Quit_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.name == "Player":
		get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

signal player_hit

func _on_Area2D_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	if body.is_in_group("enemy") and Global.CURRENT_HEALTH > 0 and body.active == true:
		Global.CURRENT_HEALTH -= 1
		emit_signal("player_hit")
