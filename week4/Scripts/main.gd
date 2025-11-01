extends Node

var level_number: int = 0
var level1 := "res://Scenes/level1.tscn"
var level2 := "res://Scenes/level2.tscn"
var levels = [level1, level2, level1]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func reset_level():
	print("reseted")
	level_number -= 1
	next_level()

func next_level():
	
	for child in get_children():
		child.queue_free()
		remove_child.call_deferred(child)
	if(level_number >= levels.size()):
		level_number = 0
		next_level()
		return 
	var level: PackedScene = load(levels[level_number])
	var instance : Levels = level.instantiate()
	add_child.call_deferred(instance)
	instance.completed.connect(next_level)
	instance.reset.connect(reset_level)
	level_number += 1
	print("next level")
