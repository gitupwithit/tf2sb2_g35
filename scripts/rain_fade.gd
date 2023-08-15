extends AnimationPlayer

func _ready():
	pass

func _on_rain_sfx_fade_in():
	self.play("fade_in")

func _on_demo_mini_game_3_fade_to_black():
	self.play("fade_out")
