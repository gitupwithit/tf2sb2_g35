extends Control

signal fade_to_black
signal global_fade_to_black
signal global_fade_in

var site_opened = false
var step = 0

func _ready():
	var fade_in_node = load("res://scenes/fade_in_scene.tscn")
	var fade_in_node_instance = fade_in_node.instance()
	fade_in_node_instance.name = "fade_in_node_instance"
	self.add_child(fade_in_node_instance)
	Globals.game_state = "demo_mini_game_4"
	emit_signal("global_fade_in")

func _on_global_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		Globals.demo_mg_score = 2
		var save_dict = {
		"scout_mg" : Globals.scout_mg_score,
		"soldier_mg" : Globals.soldier_mg_score,
		"pyro_mg" : Globals.pyro_mg_score,
		"demo_mg" : Globals.demo_mg_score,
		"heavy_mg" : Globals.heavy_mg_score,
		"engi_mg" : Globals.engi_mg_score,
		"medic_mg" : Globals.medic_mg_score,
		"sniper_mg" : Globals.sniper_mg_score,
		"spy_mg" : Globals.spy_mg_score
		}
		var json_string = to_json(save_dict)
	
		var file = File.new()
		var error = file.open("user://playerdata.dat", File.WRITE)
		if error != OK:
			print("Error opening file for writing: ", error)
			return
		print("updated game score to be written: ", json_string)
		file.store_string(json_string)
		file.close()
		
		get_tree().change_scene("res://scenes/main.tscn")

func _on_demo_mini_sprite_step():
	#print("step")
	step += 1
	if step > 10:
		emit_signal("fade_to_black")

func _on_demo_mini_area2D_demo_collided_with_fog():
	pass # Replace with function body.

func _on_glitch_sfx_finished():
	if site_opened == false:
		site_opened = true
		OS.shell_open("https://en.wikipedia.org/wiki/Rick_May")
		emit_signal("fade_to_black")
