extends Control

var fog_score = 0
var fog_over_10 = false
var fog_over_50 = false
signal fog_is_over_10
signal fog_is_over_50
signal fade_to_black
signal global_fade_to_black
signal global_fade_in
var steps_after_fog = 0

func _ready():
	var fade_in_node = load("res://scenes/fade_in_scene.tscn")
	var fade_in_node_instance = fade_in_node.instance()
	fade_in_node_instance.name = "fade_in_node_instance"
	self.add_child(fade_in_node_instance)
	var fog = preload("res://scenes/fog.tscn")
	
	Globals.game_state = "demo_mini_game_3"
	for row in 13:
		for column in 8:
			var fog_tile = fog.instance()
			add_child(fog_tile)
			fog_tile.position = Vector2(column * 155,row * 155)
	for i in self.get_children():
			if i.name.begins_with("@Fog"):
				for j in i.get_children():
					if j.name.begins_with("fog_anim"):
						j.play("fog_fade")

func _on_fade_black_animation_finished(anim_name):
	print("animation ", anim_name)
	if anim_name == "fade_to_black":
		print("scene switch and update score")
		get_tree().change_scene("res://scenes/demo_mini_game_4.tscn")

func _on_demo_mini_sprite3_step():
#	print("step")
	if fog_over_50 == true:
		steps_after_fog += 1
		print("steps after fog: ", steps_after_fog)
		if steps_after_fog > 10:
			print("steps is over 10 fade to black")
			emit_signal("fade_to_black")

func _on_demo_mini_area2D_demo_collided_with_fog():
	fog_score += 1
	print("fog score ", fog_score)
	if fog_score > 10 && fog_over_10 == false:
		emit_signal("fog_is_over_10")
		fog_over_10 = true
	if fog_score > 60 && fog_over_50 == false:
		emit_signal("fog_is_over_50")
		fog_over_50 = true
