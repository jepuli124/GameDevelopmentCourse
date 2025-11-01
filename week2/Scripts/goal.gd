extends Area2D

@onready var greenFlag : CompressedTexture2D = load("res://Assets/Textures/Flag_green.png")

func _on_body_entered(body: Node2D) -> void:
	if(body is Hero):
		$Sprite2D.texture = greenFlag
