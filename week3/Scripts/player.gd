extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
signal forwardDestroy
signal isHit

func _physics_process(delta: float) -> void:


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directionVer := Input.get_axis("up", "down")
	if directionVer:
		velocity.y = directionVer * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	



func _on_weapon_destroyed() -> void:
	forwardDestroy.emit()
