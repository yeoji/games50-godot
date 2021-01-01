extends Spatial

export var velocity: float = 20

var current_velocity: float = 0
var explosion: CPUParticles = null

func _ready():
	explosion = load("res://Game/Explosion.tscn").instance()

func _process(delta: float) -> void:
	var motion: Vector3 = Vector3.LEFT * delta * current_velocity
	transform.origin += motion

func start() -> void:
	current_velocity = velocity

func reset() -> void:
	current_velocity = 0

func _on_body_entered(body: Node):
	pass

func _destroy_helicopter(heli: Node):
	var explosion_sound: AudioStreamPlayer = get_parent().get_node("ExplosionSound")
	explosion_sound.play()
	
	# play explosions
	var smoke: CPUParticles = explosion.get_node("Smoke")
	explosion.transform.origin = heli.get("translation")
	smoke.transform.origin = heli.get("translation")
	explosion.set_emitting(true)
	smoke.set_emitting(true)
	get_parent().call_deferred('add_child_below_node', self, explosion)
	
	heli.destroy()
