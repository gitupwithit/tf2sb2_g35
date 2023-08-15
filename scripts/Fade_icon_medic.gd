extends AnimationPlayer

var played = false

func _on_medic_button_pressed():
	print("medic pressed")
	if played == false:
		played = true
		if Globals.game_state == "demo_mini_game_1":
			self.play("fade_medic")
