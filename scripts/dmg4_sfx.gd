extends AudioStreamPlayer2D
var step0
var step1
var step2
var step3
var step4
var step5
var glitch_sound
signal played_glitch_sound

var steps_sounds = []

# Called when the node enters the scene tree for the first time.
func _ready():
	step0 = load("res://audio/sfx/steps/0.mp3")
	step1 = load("res://audio/sfx/steps/1.mp3")
	step2 = load("res://audio/sfx/steps/2.mp3")
	step3 = load("res://audio/sfx/steps/3.mp3")
	step4 = load("res://audio/sfx/steps/4.mp3")
	step5 = load("res://audio/sfx/steps/5.mp3")
	steps_sounds = [step0,step1,step2,step3,step4,step5]
	glitch_sound = load("res://audio/sfx/mvm_bought_in.mp3")

var last_stepchoice = 0

func _on_demo_mini_sprite_demo_move(x_coord):
	var stepchoice = randi() % steps_sounds.size() -1
	if stepchoice == last_stepchoice:
		stepchoice += 1
		if stepchoice > steps_sounds.size():
			stepchoice = 0
#	
	self.position.x = x_coord
	self.stream = steps_sounds[stepchoice]
	self.play()
	last_stepchoice = stepchoice

func _on_glitch_area2D_play_link_sound():
	self.stop()
	print("play glitch sound")
	self.stream = glitch_sound
	self.play()
	emit_signal("played_glitch_sound")
