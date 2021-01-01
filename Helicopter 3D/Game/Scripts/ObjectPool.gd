extends Node

export var paths: Array = []
export var copies_of_each: int = 2
export var min_y: float = 0
export var max_y: float = 0
export var min_spawn_interval: int = 1000
export var max_spawn_interval: int = 2000
export var max_instance_per_interval: int = 1

var starting_x: float = 20
var last_spawn_time_ms: int = 0
var rand_spawn_interval_ms: int = 0

var object_pool: Array = []
var available_object_pool: Array = []

const LEFT_BOUND: int = -50

func _ready():
	for path in paths:
		var resource = load(path)
		
		for i in copies_of_each:
			var object = resource.instance()
			object.transform.origin = _get_random_position()
			
			object_pool.append(object)
			available_object_pool.append(object)
			
			get_parent().call_deferred('add_child_below_node', self, object)
		
	pass

func _process(delta):
	var time_diff: int = OS.get_system_time_msecs() - last_spawn_time_ms
	if time_diff > rand_spawn_interval_ms:
		for i in max_instance_per_interval:
			var available_object = _find_and_remove_available_object()
			if available_object:
				available_object.start()
				
		last_spawn_time_ms = OS.get_system_time_msecs()
		rand_spawn_interval_ms = rand_range(min_spawn_interval, max_spawn_interval)
		_add_to_available_objects()

func _add_to_available_objects() -> void:
	for object in object_pool:
		if object.is_inside_tree() and object.transform.origin.x < LEFT_BOUND:
			object.transform.origin = _get_random_position()
			object.reset()
			available_object_pool.append(object)

func _find_and_remove_available_object() -> Node2D:
	if available_object_pool.size() == 0:
		return null
	var available_index: int = randi() % available_object_pool.size()
	var available_object = available_object_pool[available_index]
	available_object_pool.remove(available_index)
	return available_object

func _get_random_position() -> Vector3:
	var starting_y: float = rand_range(min_y, max_y)
	return Vector3(starting_x, starting_y, 0)
