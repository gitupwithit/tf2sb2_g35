extends ColorRect

func _ready():
	print("demo mg =", Globals.demo_mg_score)
	if Globals.demo_mg_score < 2:
		self.visible = false
		get_node("glitch_area2D").set("Monitoring",false)
	else:
		self.visible = true
		get_node("glitch_area2D").set("Monitoring",true)
		self.rect_position = Vector2(440 + (randi() % 390), randi() % 1650)
