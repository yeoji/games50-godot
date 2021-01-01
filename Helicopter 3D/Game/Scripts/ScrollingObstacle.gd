extends Spatial

export var velocity: float = 20

var current_velocity: float = 0

func _process(delta: float) -> void:
	var motion: Vector3 = Vector3.LEFT * delta * current_velocity
	transform.origin += motion

func start() -> void:
	current_velocity = velocity

func reset() -> void:
	current_velocity = 0

func _on_body_entered(body: Node):
	if body.name == "Helicopter":
		var game_over_text: Label = get_parent().get_node("GameOver")
		game_over_text.set_text(str("GAME OVER\nYOUR SCORE:\n", PlayerState.score, " COINS\nPRESS SPACE TO RESTART!"))
		game_over_text.show()
		
		_destroy_helicopter(body)

func _destroy_helicopter(heli: Node):
	# play explosions
	var explosion: CPUParticles = load("res://Game/Explosion.tscn").instance()
	var smoke: CPUParticles = explosion.get_node("Smoke")
	explosion.transform.origin = heli.get("translation")
	smoke.transform.origin = heli.get("translation")
	explosion.set_emitting(true)
	smoke.set_emitting(true)
	get_parent().call_deferred('add_child_below_node', self, explosion)
	
	heli.destroy()
