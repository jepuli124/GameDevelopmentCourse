
class_name WoodBeam extends RigidBody2D
	


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if(event.is_action_pressed("Click")):
		queue_free()
