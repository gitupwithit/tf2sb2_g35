extends Area2D

signal collision

func _ready():
	pass # Replace with function body.

func _on_fog_anim_animation_finished(animation_name):
	if animation_name == "fog_fade":
		self.queue_free()

func _on_fog_area_entered(area):
	print("fog collided with", area.get_parent().get_name())
	if area.get_parent().get_name() == "demo_mini_sprite3":
		emit_signal("collision")
