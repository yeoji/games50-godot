extends Node

export var map_width: int = 10
export var map_height: int = 10

export var floor_mesh: Mesh = null

func _ready():
	generate_floors()

func generate_floors():
	for x in map_width:
		var instance = MeshInstance.new()
		instance.set_mesh(floor_mesh)
		instance.transform.origin = Vector3(x, 0, 0)
		
		add_child(instance)
	pass
