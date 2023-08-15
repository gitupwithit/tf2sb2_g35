extends AudioStreamPlayer

var demo_happy
var demo_sad

func _ready():
	demo_happy = load("res://audio/decriptions/demo_is_happy.mp3")
	demo_sad = load("res://audio/decriptions/demo_is_sad.mp3")

func _on_demo_button_demo_happy():
	if Globals.descriptions == true:
		self.stream = demo_happy
		self.play()

func _on_demo_button_demo_sad():
	if Globals.descriptions == true:
		self.stream = demo_sad
		self.play()
