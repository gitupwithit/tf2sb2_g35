extends AnimationPlayer

func _on_demo_mini_game_2_fade_in():
	print("fade in dmg2")
	self.play("fade_in")

func _on_Area2D_area_entered(area):
	self.play("fade_to_black")
