extends AnimationPlayer

func _on_demo_button_fade_out():
	print("fade out now")
	self.play("fade_to_black")
