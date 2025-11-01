extends Node

@onready var score := $UI
var HP := 3

func _on_player_forward_destroy() -> void:
	score.add_score()



func _on_player_is_hit() -> void:
	HP -= 1
	if(HP == 0):
		HP = 3
	score.update_health(HP)
