extends Area

export var points: int = 1
export var velocity: float = 20

var current_velocity: float = 0

func _process(delta: float) -> void:
	var motion: Vector3 = Vector3.LEFT * delta * current_velocity
	transform.origin += motion

func start() -> void:
	current_velocity = velocity

func reset() -> void:
	show()
	current_velocity = 0
	
func _on_body_entered(body):
	if body.name == "Helicopter":
		var pickup: CPUParticles = load("res://Game/Pickup.tscn").instance()
		pickup.transform.origin = body.get("translation")
		pickup.set_emitting(true)
		get_parent().call_deferred('add_child_below_node', self, pickup)
	
		PlayerState.score += points
		
		var score_text: RichTextLabel = get_parent().get_node("Score")
		score_text.set_text(str("COINS: ", PlayerState.score))
		
		hide()
