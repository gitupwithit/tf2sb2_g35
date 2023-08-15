extends CanvasLayer

func _ready():
	print("fade out scene added")
	$black/FadeOutAnimationPlayer.play("fade_out")

func _on_FadeOutAnimationPlayer_animation_finished(anim_name):
	print(anim_name)
	print("switch scene now")
	var from = Globals.from_scene
	var to = Globals.to_scene
	Globals.switch_scene(from, to)
	get_parent().get_parent().queue_free()
	self.queue_free()
