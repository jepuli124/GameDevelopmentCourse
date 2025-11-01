extends Area2D
class_name Spike
signal reset

func _on_body_entered(body: Node2D) -> void:
	if(body is Player):
		reset.emit()
