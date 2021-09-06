extends Actor

func _ready():
	if movement == true:
		velocity.x = -SPEED

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	if is_on_wall():
		velocity.x *= -1
		if $AnimatedSprite.flip_h == false:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
			
	velocity.y = move_and_slide(velocity, Vector2.UP).y
