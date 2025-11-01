extends Control
class_name UI

var score := 0
@onready var label: Label = $Score 
@onready var HP: Label = $HP 
func add_score() -> void:
	score += 1
	label.text = "Score: " + str(score) + " good job."

func update_health(hp: int) -> void:
	HP.text = str(hp)
	if(hp == 3):
		score = 0
		label.text = "Score: " + str(score) + " not good job."
