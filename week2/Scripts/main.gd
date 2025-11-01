extends Node2D

@onready var wooden_beam_scene : PackedScene = load("res://Scenes/wood_beam.tscn")

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("RClick")):
		var beam = wooden_beam_scene.instantiate()
		beam.position = get_viewport().get_mouse_position()
		$".".add_child(beam)
