extends Area2D
class_name Meteor

@export var MovementSpeed : int = 20
@export var Health := 3


func _process(delta: float) -> void:
	position.y += MovementSpeed * delta

func handleDamage(damage: int = 1) -> bool:
	Health -= damage
	if(Health <= 0):
		queue_free()
		return true
	return false


func _on_body_entered(body: Node2D) -> void:
	
	if(body is Player):
		print("player hit")
		body.isHit.emit()
		queue_free()
