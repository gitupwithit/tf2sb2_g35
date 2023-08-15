extends Control

var fade_score

signal fade_in
signal fade_to_black

func _ready():
	var fade_in_node = load("res://scenes/fade_in_scene.tscn")
	var fade_in_node_instance = fade_in_node.instance()
	fade_in_node_instance.name = "fade_in_node_instance"
	self.add_child(fade_in_node_instance)
	print("dmg1 loaded")
	fade_score = 8
	
	Globals.game_state = "demo_mini_game_1"
	print("2game state = ", Globals.game_state)
	
func _on_Fade_screen_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		get_tree().change_scene("res://scenes/demo_mini_game_2.tscn")
		print("change to demo mg2")

func _on_Fade_icon_scout_animation_finished(anim_name):
	print("anim name: ", anim_name)
	if Globals.game_state == "demo_mini_game_1":
		fade_score -= 1
		print("fade score = ", fade_score)
		if fade_score < 1:
			emit_signal("fade_to_black") # signal start of mini game 2

func _on_Fade_icon_soldier_animation_finished(anim_name):
	print("anim name: ", anim_name)
	if Globals.game_state == "demo_mini_game_1":
		fade_score -= 1
		print("fade score = ", fade_score)
		if fade_score < 1:
			emit_signal("fade_to_black") # signal start of mini game 2

func _on_Fade_icon_pyro_animation_finished(anim_name):
	print("anim name: ", anim_name)
	if Globals.game_state == "demo_mini_game_1":
		fade_score -= 1
		print("fade score = ", fade_score)
		if fade_score < 1:
			emit_signal("fade_to_black") # signal start of mini game 2

func _on_Fade_icon_heavy_animation_finished(anim_name):
	print("anim name: ", anim_name)
	if Globals.game_state == "demo_mini_game_1":
		fade_score -= 1
		print("fade score = ", fade_score)
		if fade_score < 1:
			emit_signal("fade_to_black") # signal start of mini game 2

func _on_Fade_icon_engi_animation_finished(anim_name):
	print("anim name: ", anim_name)
	if Globals.game_state == "demo_mini_game_1":
		fade_score -= 1
		print("fade score = ", fade_score)
		if fade_score < 1:
			emit_signal("fade_to_black") # signal start of mini game 2

func _on_Fade_icon_medic_animation_finished(anim_name):
	print("anim name: ", anim_name)
	if Globals.game_state == "demo_mini_game_1":
		fade_score -= 1
		print("fade score = ", fade_score)
		if fade_score < 1:
			emit_signal("fade_to_black") # signal start of mini game 2

func _on_Fade_icon_sniper_animation_finished(anim_name):
	print("anim name: ", anim_name)
	if Globals.game_state == "demo_mini_game_1":
		fade_score -= 1
		print("fade score = ", fade_score)
		if fade_score < 1:
			emit_signal("fade_to_black") # signal start of mini game 2

func _on_Fade_icon_spy_animation_finished(anim_name):
	print("anim name: ", anim_name)
	if Globals.game_state == "demo_mini_game_1":
		fade_score -= 1
		print("fade score = ", fade_score)
		if fade_score < 1:
			emit_signal("fade_to_black") # signal start of mini game 2
