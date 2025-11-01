extends RigidBody2D
class_name Hero

func _process(delta: float) -> void:
	if(Input.is_action_pressed("Unfreeze")):
		freeze = false
		
