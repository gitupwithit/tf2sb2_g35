extends Button

func _on_phone_button_button_down():
	self.visible = false
	get_tree().root.get_node("scout_mg").ring_phone()
