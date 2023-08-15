extends AudioStreamPlayer

var played_once = false

func _on_start_pressed():
	if played_once == false:
		self.play()
		played_once = true
