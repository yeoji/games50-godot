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
	current_velocity = 0
