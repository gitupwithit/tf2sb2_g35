extends AnimationPlayer

func _on_demo_minigame_1_fade_to_black():
	self.play("fade_to_black")

func _on_demo_minigame_1_fade_in():
	print("should fade in now")
	self.play("fade_in")
