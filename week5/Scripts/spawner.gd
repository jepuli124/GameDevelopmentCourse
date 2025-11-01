extends Node3D

@export var PlatformSPEED = 20
@onready var smallPlatform = preload("res://Scenes/small_platform.tscn")
@onready var mediumPlatform = preload("res://Scenes/medium_platform.tscn")
@onready var largePlatform = preload("res://Scenes/large_platform.tscn")
var platforms = [smallPlatform, mediumPlatform, largePlatform]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_obsticle():
	var PS : PackedScene = platforms.pick_random()
	var newPlatform = PS.instantiate()
	newPlatform.velocity.y = PlatformSPEED
	add_child(newPlatform)
	
func _on_timer_timeout() -> void:
	create_obsticle() # Replace with function body.
