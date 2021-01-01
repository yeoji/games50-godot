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
		var game_over_text: RichTextLabel = get_parent().get_node("GameOver")
		game_over_text.show()
		
		# play explosions
		var explosion: CPUParticles = load("res://Game/Explosion.tscn").instance()
		explosion.transform.origin = body.get("translation")
		explosion.set_emitting(true)
		get_parent().call_deferred('add_child_below_node', self, explosion)
		
		body.queue_free()
