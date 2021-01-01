extends "res://Game/Scripts/ScrollingReward.gd"

func _ready():
	var rotation_tween: Tween = get_node("Rotation")
	rotation_tween.interpolate_property(
		self, "rotation_degrees", 
		Vector3(0, 0 , 0), Vector3(0, 3600, 0), 
		10, Tween.TRANS_BACK, Tween.EASE_IN
	)
	rotation_tween.start()
