extends Spatial

func _process(delta: float) -> void:
	var game_over_text: Label = get_node("GameOver")
	if game_over_text.visible and Input.is_action_just_pressed("restart"):
		game_over_text.hide()
		
		_restart_game()

func _restart_game() -> void:
	PlayerState.score = 0
	var score = get_node("Score")
	score.set_text("COINS: 0")
	
	var heli = get_node("Helicopter")
	heli.reset()
