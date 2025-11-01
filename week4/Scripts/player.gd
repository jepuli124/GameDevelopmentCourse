extends CharacterBody2D
class_name Player

signal reset
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animSprite := $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if global_position.y > 500:
		reset.emit()

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animSprite.play("run")
		if((not Input.is_action_just_pressed("ui_left")) and (not Input.is_action_just_pressed("ui_right"))):
			animSprite.set_flip_h(false if direction < 0 else true)

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animSprite.play("idle")

	move_and_slide()

func coin_collected():
	pass
