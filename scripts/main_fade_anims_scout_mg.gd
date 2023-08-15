extends AnimationPlayer

func _on_main_fade_anims_scout_mg_animation_finished(anim_name):
	print(anim_name)
	if anim_name == "fade_in":
		get_parent().get_node("black_scout_mg").visible = false
		print(get_parent().get_node("black_scout_mg").visible)
	
	if anim_name == "fade_out":
		print("it did this")
		get_tree().change_scene("res://scenes/main.tscn")

