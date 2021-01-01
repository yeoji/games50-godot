extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = get_parent().get_node("Viewport").get_texture()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
