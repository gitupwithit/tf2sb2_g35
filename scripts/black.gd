extends ColorRect

func _ready():
	self.visible = true

func _on_global_fade_screen_animation_finished(anim_name):
	if anim_name == "fade_in":
		self.visible = false

func _on_Area2D_area_entered(area):
	self.visible = true

func _on_demo_button_fade_out():
	self.visible = true

func _on_main_fade_anims_animation_finished(anim_name):
	if anim_name == "fade_in":
		self.visible = false
