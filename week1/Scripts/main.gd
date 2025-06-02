extends Node2D

class_name firstClass

 
func _process(delta: float) -> void:
	var Movement := 90 * delta
	var MovementVector: Vector2 
	if Input.is_action_pressed('Up'):
		MovementVector.y -= 1
	if Input.is_action_pressed('Down'):
		MovementVector.y += 1
	if Input.is_action_pressed('Left'):
		MovementVector.x -= 1
	if Input.is_action_pressed('Right'):
		MovementVector.x += 1
	$%Icon.position += MovementVector.normalized() * Movement
