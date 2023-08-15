extends AnimationPlayer

var played = false

func _on_soldier_button_pressed():
	print("soldier pressed")
	if played == false:
		played = true
		if Globals.game_state == "demo_mini_game_1":
			self.play("fade_soldier")
