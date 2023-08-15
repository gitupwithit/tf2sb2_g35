extends AudioStreamPlayer

var played = false

func _on_demo_mini_sprite3_step():
	if Globals.descriptions == true:
		if played == false:
			played = true
			self.play()
