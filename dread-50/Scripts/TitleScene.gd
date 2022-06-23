extends Node2D

export var play_scene: String = "res://Scenes/Game.tscn"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene(play_scene)
