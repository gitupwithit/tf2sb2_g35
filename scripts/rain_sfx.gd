extends AudioStreamPlayer2D

signal fade_in
signal fade_out

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream = load("res://audio/sfx/rain.mp3")
	self.play()
	emit_signal("fade_in")

