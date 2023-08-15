extends AudioStreamPlayer

var merc_fades_out
var small_demo_walks

func _ready():
	merc_fades_out = load("res://audio/decriptions/merc_fades_out.mp3")
	small_demo_walks = load("res://audio/decriptions/small_demo_walks.mp3")

func _on_area_2d_area_entered(_area):
	if Globals.descriptions == true:
		self.stream = merc_fades_out
		self.play()

func _on_demo_mini_play_sound():
	if Globals.descriptions == true:
		self.stream = small_demo_walks
		self.play()

func _on_Area2D_area_entered(area):
	pass # Replace with function body.
