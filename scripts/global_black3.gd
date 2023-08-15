extends ColorRect

func _ready():
#	self.visible = true
	pass
	
func _on_global_animation_player3_animation_finished(anim_name):
	if anim_name == "fade_in":
		self.visible = false
