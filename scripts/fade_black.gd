extends AnimationPlayer

func _ready():
#	self.play("black")
	pass

func _on_demo_mini_game_3_fog_is_over_10():
	print("10")
	self.play("fade_in_1")

func _on_demo_mini_game_3_fog_is_over_50():
	print("50")
	self.play("fade_in")

func _on_demo_mini_game_3_fade_to_black():
	print("fade to black dmg3")
	self.play("fade_to_black")
