extends AudioStreamPlayer

var wrench = load("res://audio/sfx/wrench_hit.mp3")
var bought_in = load("res://audio/sfx/mvm_bought_in.mp3")

func _ready():
	self.stream = load("res://audio/sfx/Coach_defend_here.mp3")
	self.play()

func _on_captions_pressed():
	self.stream = wrench
	self.play()

func _on_contact_pressed():
	self.stream = bought_in
	self.play()

func _on_Descriptions_pressed():
	self.stream = wrench
	self.play()
