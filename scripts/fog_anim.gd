extends AnimationPlayer

func _ready():
	self.play("fade_in")

func _on_fog_collision():
#	print("fog fade out anim")
	self.play("fog_fade")
