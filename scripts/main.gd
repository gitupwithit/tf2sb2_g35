# mmods: 0 = neutral, 1 = happy, 2 = angry, 3 = magic (to be added)
# game states: "start_menu", "main", "demo_mini_game_1", "demo_mini_game_2", "demo_mini_game_3", "main_dmg_complete"
extends Control

signal scout_mood
signal pyro_mood
signal soldier_mood
signal demo_mood
signal heavy_mood
signal engi_mood
signal medic_mood
signal sniper_mood
signal spy_mood

var fading = false
var mood = 0
var merc
var old_merc
var scout_mg_available = false
const MOOD_COUNT = 3 # update to 4 when magic

func _ready():
	var fade_in_node = load("res://scenes/fade_in_scene.tscn")
	var fade_in_node_instance = fade_in_node.instance()
	fade_in_node_instance.name = "fade_in_node_instance"
	self.add_child(fade_in_node_instance)
#	print("main loaded")
	Globals.game_state = "main"
#	print("game state = ", Globals.game_state)
	print(Globals.scout_mg_score)
	if Globals.scout_mg_score < 1:
		pass
	else:
		print("timer start")
		$scout_button/scout_mg_timer.start(5)

func _on_scout_mg_timer_timeout():
	if fading == false:
		if scout_mg_available == true:
			scout_mg_available = false
			$scout_button/scout_mg_timer.start(5)
		else:
			scout_mg_available = true
			$phone_ring.play()
			$scout_button/scout_mg_timer.start(2)
		print("scout minigame available: ", scout_mg_available)

func mood_generate(merc):
	if merc == old_merc:
		var new_mood = randi() % MOOD_COUNT
		if new_mood == mood:
			mood +=1
			if mood > MOOD_COUNT - 1:
				mood = 0
		else:
			mood = new_mood
		if merc == "scout":
			emit_signal("scout_mood", mood)
		if merc == "soldier":
			emit_signal("soldier_mood", mood)
		if merc == "pyro":
			emit_signal("pyro_mood", mood)
		if merc == "demo":
			emit_signal("demo_mood", mood)
		if merc == "heavy":
			emit_signal("heavy_mood", mood)
		if merc == "engi":
			emit_signal("engi_mood", mood)
		if merc == "medic":
			emit_signal("medic_mood", mood)
		if merc == "sniper":
			emit_signal("sniper_mood", mood)
		if merc == "spy":
			emit_signal("spy_mood", mood)
	else:
		if merc == "scout":
			emit_signal("scout_mood", mood)
		if merc == "soldier":
			emit_signal("soldier_mood", mood)
		if merc == "pyro":
			emit_signal("pyro_mood", mood)
		if merc == "demo":
			emit_signal("demo_mood", mood)
		if merc == "heavy":
			emit_signal("heavy_mood", mood)
		if merc == "engi":
			emit_signal("engi_mood", mood)
		if merc == "medic":
			emit_signal("medic_mood", mood)
		if merc == "sniper":
			emit_signal("sniper_mood", mood)
		if merc == "spy":
			emit_signal("spy_mood", mood)
	old_merc = merc

func _on_scout_button_pressed():
#	print("scout button pressed")
	Globals.last_pressed = 0
	if scout_mg_available == true:
		print("fade to black for scout mg")
		var from = "main"
		var to = "scout_mg"
		Globals.fade_out_scene(from, to)
		$scout_button/scout_mg_timer.stop()
	else:
		if Globals.game_state == "main":
			merc = "scout"
			mood_generate(merc)

func _on_soldier_button_pressed():
	Globals.last_pressed = 1
	if Globals.game_state == "main":
		merc = "soldier"
		mood_generate(merc)

func _on_pyro_button_pressed():
	Globals.last_pressed = 2
	if Globals.game_state == "main":
		merc = "pyro"
		mood_generate(merc)

func _on_demo_button_choose_anim():
	Globals.last_pressed = 3
	print("demo button pressed")
	if Globals.game_state == "main":
		merc = "demo"
		mood_generate(merc)

func _on_heavy_button_pressed():
	Globals.last_pressed = 4
	if Globals.game_state == "main":
		merc = "heavy"
		mood_generate(merc)

func _on_engi_button_pressed():
	Globals.last_pressed = 5
	if Globals.game_state == "main":
		merc = "engi"
		mood_generate(merc)

func _on_medic_button_pressed():
	Globals.last_pressed = 6
	if Globals.game_state == "main":
		merc = "medic"
		mood_generate(merc)

func _on_sniper_button_pressed():
	Globals.last_pressed = 7
	if Globals.game_state == "main":
		merc = "sniper"
		mood_generate(merc)

func _on_spy_button_pressed():
	Globals.last_pressed = 8
	if Globals.game_state == "main":
		merc = "spy"
		mood_generate(merc)

