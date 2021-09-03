extends KinematicBody2D

export (int) var SPEED = 300
export (int) var GRAVITY = 6000
export (int) var JUMP_FORCE = -1000

var velocity = Vector2.ZERO

func _ready():
	print(self.name)

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	# get direction pressed, left or right.
	direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.x = direction * SPEED
	
	if !is_on_floor():
		velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_FORCE
			
	# Jump cancel
	if Input.is_action_just_released("jump"):
		if velocity.y < -100:
			velocity.y = -100
			
	# Run (shift, triggers)
			
	print(velocity.y)
	
	if Input.is_action_just_pressed("shoot"):
		print("SHOOT")
	
	move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	$dialogue.text = "quack"
	$dialogue.visible = true
	$dialogue_timer.start()


func _on_dialogue_timer_timeout() -> void:
	$dialogue.text = ""
	$dialogue.visible = false
