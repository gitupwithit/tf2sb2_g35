extends Control

signal fade_in

func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed == true:
		print(event.position)  # the position of the touch

func _ready():
	var fade_in_node = load("res://scenes/fade_in_scene.tscn")
	var fade_in_node_instance = fade_in_node.instance()
	fade_in_node_instance.name = "fade_in_node_instance"
	self.add_child(fade_in_node_instance)
	Globals.game_state = "demo_mini_game_2"
	print("changed to demo_mg2")
	

func _on_global_fade_screen_animation_finished(anim_name):
	print("swithc to dmg3 now")
	if anim_name == "fade_to_black":
		get_tree().change_scene("res://scenes/demo_mini_game_3.tscn")
