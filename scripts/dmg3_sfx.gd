extends AudioStreamPlayer2D

var steps_sounds = []

# Called when the node enters the scene tree for the first time.
func _ready():
	steps_sounds.append(load("res://audio/sfx/steps/0.mp3"))
	steps_sounds.append(load("res://audio/sfx/steps/1.mp3"))
	steps_sounds.append(load("res://audio/sfx/steps/2.mp3"))
	steps_sounds.append(load("res://audio/sfx/steps/3.mp3"))
	steps_sounds.append(load("res://audio/sfx/steps/4.mp3"))
	steps_sounds.append(load("res://audio/sfx/steps/5.mp3"))
	print("step sounds:", steps_sounds)

var last_stepchoice = 0

func _on_demo_mini_sprite3_demo_move(x_coord):
	var stepchoice = randi() % steps_sounds.size() -1
	if stepchoice == last_stepchoice:
		stepchoice += 1
		if stepchoice > steps_sounds.size():
			stepchoice = 0
	self.stream = steps_sounds[stepchoice]
	self.position.x = x_coord
	self.play()
	last_stepchoice = stepchoice
