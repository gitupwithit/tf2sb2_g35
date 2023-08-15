extends AnimationPlayer

var played = false

func _on_sniper_button_pressed():
	print("sniper pressed")
	if played == false:
		played = true
		if Globals.game_state == "demo_mini_game_1":
			self.play("fade_sniper")
