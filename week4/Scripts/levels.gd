extends Node2D
class_name Levels
signal completed
signal reset
var coin_amount := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is Coin:
			coin_amount += 1
			child.collected.connect(_on_coin_collected)
		elif child is Spike:
			child.reset.connect(reset.emit)
		elif child is Player:
			child.reset.connect(reset.emit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_coin_collected() -> void:
	coin_amount -= 1
	print(coin_amount)
	if(coin_amount <= 0):
		print("completed")
		completed.emit()
