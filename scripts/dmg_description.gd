extends AudioStreamPlayer
var merc_fade
var soldier_fade

func _ready():
	merc_fade = load("res://audio/decriptions/merc_fades_out.mp3")
	soldier_fade = load("res://audio/decriptions/mercenary_fades.mp3")

func _on_scout_button_pressed():
	if Globals.descriptions == true:
		self.stream = merc_fade
		self.play()

func _on_soldier_button_pressed():
	if Globals.descriptions == true:
		self.stream = soldier_fade
		self.play()

func _on_pyro_button_pressed():
	if Globals.descriptions == true:
		self.stream = merc_fade
		self.play()

func _on_medic_button_pressed():
	if Globals.descriptions == true:
		self.stream = merc_fade
		self.play()

func _on_sniper_button_pressed():
	if Globals.descriptions == true:
		self.stream = merc_fade
		self.play()

func _on_spy_button_pressed():
	if Globals.descriptions == true:
		self.stream = merc_fade
		self.play()

func _on_heavy_button_pressed():
	if Globals.descriptions == true:
		self.stream = merc_fade
		self.play()

func _on_engi_button_pressed():
	if Globals.descriptions == true:
		self.stream = merc_fade
		self.play()
