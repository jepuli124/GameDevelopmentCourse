extends CharacterBody3D

class_name Player
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
signal died

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if global_position.y <= -20:
		died.emit() 
		queue_free()

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_axis("left", "right")
	if input_dir:
		velocity.x = input_dir*SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
