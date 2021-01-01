extends Sprite

export var scroll_speed: float = -5
var g_texture_width: float = 0

func _ready():
	g_texture_width = texture.get_size().x * scale.x

func _process(delta: float) -> void:
	position.x += scroll_speed
	_attempt_reposition()
	
func _attempt_reposition() -> void:
	if position.x < -g_texture_width:
		position.x += 2 * g_texture_width
