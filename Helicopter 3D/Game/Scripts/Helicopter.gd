extends KinematicBody

var speed: float = 20
var velocity: Vector3 = Vector3()

func _ready():
	pass

func _physics_process(delta: float) -> void:
	var direction: float = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	var motion: Vector3 = Vector3.UP * direction * delta * speed
	
	move_and_collide(motion)

func destroy() -> void:
	var collision: CollisionShape = get_node("BodyCollision")
	collision.set_disabled(true)
	hide()

func reset() -> void:
	var collision: CollisionShape = get_node("BodyCollision")
	collision.set_disabled(false)
	show()
