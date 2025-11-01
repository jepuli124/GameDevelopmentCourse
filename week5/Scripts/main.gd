extends Node
class_name Main
var score = 0
var highScore = 0
@onready var scoreBoard := $UI/Score
@onready var highScoreBoard := $UI/HighScore
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(FileAccess.file_exists("user://highscore.txt")):
		var file = FileAccess.open("user://highscore.txt", FileAccess.READ)
		highScore = int(file.get_as_text())
	else:
		FileAccess.open("user://highscore.txt", FileAccess.READ)
	highScoreBoard.text = "High Score: " + str(highScore)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	score += 1 # Replace with function body.
	scoreBoard.text = "Score: " + str(score)


func _on_player_died() -> void:
	$Timer.stop()
	print("score, highscore", score, highScore)
	if(score > highScore):
		var file = FileAccess.open("user://highscore.txt", FileAccess.WRITE)
		file.store_string(str(score))

		highScoreBoard.text = "High Score: " + str(score)
