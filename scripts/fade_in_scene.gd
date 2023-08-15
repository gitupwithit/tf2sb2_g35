extends CanvasLayer

func _ready():
	$black/FadeInAnimationPlayer.play("fade_in")
	print("fade in now")

func _on_FadeInAnimationPlayer_animation_finished(anim_name):
	self.queue_free()
