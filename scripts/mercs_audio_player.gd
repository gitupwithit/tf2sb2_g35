extends AudioStreamPlayer

var last_scout
var current_scout
var last_soldier
var current_soldier
var last_pyro
var current_pyro
var last_demo
var current_demo
var last_heavy
var current_heavy
var last_engi
var current_engi
var last_medic
var current_medic
var last_sniper
var current_sniper
var last_spy
var current_spy

signal soundEmitted

func _ready():
	pass

func _on_scout_button_play_sound(mood):
	var scout0_sounds = Globals.scout0_sounds
	var scout1_sounds = Globals.scout1_sounds
	var scout2_sounds = Globals.scout2_sounds
	print("play scout sound")
	if mood == 0:
		if scout0_sounds.size() == 0:
			print("Scout0 sounds are not initialized.")
			return
		current_scout = scout0_sounds[randi() % scout0_sounds.size()]
		current_scout = randi() % scout0_sounds.size()
		if current_scout == last_scout:
			current_scout += 1
			if current_scout > scout0_sounds.size():
				current_scout = 0
		print("current scout = ", mood, current_scout)
		self.stream = scout0_sounds[current_scout]
		self.play()
	if mood == 1:
		if scout1_sounds.size() == 0:
			print("Scout0 sounds are not initialized.")
			return
		current_scout = scout1_sounds[randi() % scout1_sounds.size()]
		current_scout = randi() % scout1_sounds.size()
		if current_scout == last_scout:
			current_scout += 1
			if current_scout > scout1_sounds.size():
				current_scout = 0
		print("current scout = ", mood, current_scout)
		self.stream = scout1_sounds[current_scout]
		self.play()
	if mood == 2:
		if scout2_sounds.size() == 0:
			print("Scout0 sounds are not initialized.")
			return
		current_scout = scout2_sounds[randi() % scout2_sounds.size()]
		current_scout = randi() % scout2_sounds.size()
		if current_scout == last_scout:
			current_scout += 1
			if current_scout > scout2_sounds.size():
				current_scout = 0
		print("current scout = ", mood, current_scout)
		self.stream = scout2_sounds[current_scout]
		self.play()
	#if mood == 3:
	if mood != 0:
		if str(current_scout).length() < 2:
			emit_signal("soundEmitted", str(mood) + "0" + str(current_scout))
		else:
			emit_signal("soundEmitted", str(mood) + str(current_scout))
	else:
		emit_signal("soundEmitted", current_scout)
	print("last scout: ", last_scout)
	last_scout = current_scout

func _on_soldier_button_play_sound(mood):
	var soldier0_sounds = Globals.soldier0_sounds
	var soldier1_sounds = Globals.soldier1_sounds
	var soldier2_sounds = Globals.soldier2_sounds
	if mood == 0:
		current_soldier = soldier0_sounds[randi() % soldier0_sounds.size()]
		current_soldier = randi() % soldier0_sounds.size()
		if current_soldier == last_soldier:
			current_soldier += 1
			if current_soldier > soldier0_sounds.size():
				current_soldier = 0
		self.stream = soldier0_sounds[current_soldier]
		self.play()
	if mood == 1:
		current_soldier = soldier1_sounds[randi() % soldier1_sounds.size()]
		current_soldier = randi() % soldier1_sounds.size()
		if current_soldier == last_soldier:
			current_soldier += 1
			if current_soldier > soldier1_sounds.size():
				current_soldier = 0
		self.stream = soldier1_sounds[current_soldier]
		self.play()
	if mood == 2:
		current_soldier = soldier2_sounds[randi() % soldier2_sounds.size()]
		current_soldier = randi() % soldier2_sounds.size()
		if current_soldier == last_soldier:
			current_soldier += 1
			if current_soldier > soldier2_sounds.size():
				current_soldier = 0
		self.stream = soldier2_sounds[current_soldier]
		self.play()
	#if mood == 3:

	if str(current_soldier).length() < 2:
		emit_signal("soundEmitted", "1"+ str(mood) + "0" + str(current_soldier))
	else:
		emit_signal("soundEmitted", "1" + str(mood) + str(current_soldier))

	print("current soldier: ", current_soldier)
#	print("last soldier: ", last_soldier)
	last_soldier = current_soldier

func _on_pyro_button_play_sound(mood):
	var pyro0_sounds = Globals.pyro0_sounds
	var pyro1_sounds = Globals.pyro1_sounds
	var pyro2_sounds = Globals.pyro2_sounds
	if mood == 0:
		current_pyro = pyro0_sounds[randi() % pyro0_sounds.size()]
		current_pyro = randi() % pyro0_sounds.size()
		if current_pyro == last_pyro:
			current_pyro += 1
			if current_pyro > pyro0_sounds.size():
				current_pyro = 0
		self.stream = pyro0_sounds[current_pyro]
		self.play()
	if mood == 1:
		current_pyro = pyro1_sounds[randi() % pyro1_sounds.size()]
		current_pyro = randi() % pyro1_sounds.size()
		if current_pyro == last_pyro:
			current_pyro += 1
			if current_pyro > pyro1_sounds.size():
				current_pyro = 0
		self.stream = pyro1_sounds[current_pyro]
		self.play()
	if mood == 2:
		current_pyro = pyro2_sounds[randi() % pyro2_sounds.size()]
		current_pyro = randi() % pyro2_sounds.size()
		if current_pyro == last_pyro:
			current_pyro += 1
			if current_pyro > pyro2_sounds.size():
				current_pyro = 0
		self.stream = pyro2_sounds[current_pyro]
		self.play()
	#if mood == 3:
	
	if str(current_pyro).length() < 2:
		emit_signal("soundEmitted", "2"+ str(mood) + "0" + str(current_pyro))
	else:
		emit_signal("soundEmitted", "2" + str(mood) + str(current_pyro))
	
	print("current pyro: ", current_pyro)
#	print("last pyro: ", last_pyro)
	last_pyro = current_pyro

func _on_demo_button_play_sound(mood):
	var demo0_sounds = Globals.demo0_sounds
	var demo1_sounds = Globals.demo1_sounds
	var demo2_sounds = Globals.demo2_sounds
	if mood == 0:
		current_demo = demo0_sounds[randi() % demo0_sounds.size()]
		current_demo = randi() % demo0_sounds.size()
		if current_demo == last_demo:
			current_demo += 1
			if current_demo > demo0_sounds.size():
				current_demo = 0
		self.stream = demo0_sounds[current_demo]
		self.play()
	if mood == 1:
		current_demo = demo1_sounds[randi() % demo1_sounds.size()]
		current_demo = randi() % demo1_sounds.size()
		if current_demo == last_demo:
			current_demo += 1
			if current_demo > demo1_sounds.size():
				current_demo = 0
		self.stream = demo1_sounds[current_demo]
		self.play()
	if mood == 2:
		current_demo = demo2_sounds[randi() % demo2_sounds.size()]
		current_demo = randi() % demo2_sounds.size()
		if current_demo == last_demo:
			current_demo += 1
			if current_demo > demo2_sounds.size():
				current_demo = 0
		self.stream = demo2_sounds[current_demo]
		self.play()
	#if mood == 3:
	
	if str(current_demo).length() < 2:
		emit_signal("soundEmitted", "3"+ str(mood) + "0" + str(current_demo))
	else:
		emit_signal("soundEmitted", "3" + str(mood) + str(current_demo))
	
	print("current demo: ", current_demo)
#	print("last demo: ", last_demo)
	last_demo = current_demo

func _on_heavy_button_play_sound(mood):
	var heavy0_sounds = Globals.heavy0_sounds
	var heavy1_sounds = Globals.heavy1_sounds
	var heavy2_sounds = Globals.heavy2_sounds
	if mood == 0:
#		current_heavy = heavy0_sounds[randi() % heavy0_sounds.size()]
		current_heavy = randi() % heavy0_sounds.size()
		if current_heavy == last_heavy:
			current_heavy += 1
			if current_heavy > heavy0_sounds.size():
				current_heavy = 0
		self.stream = heavy0_sounds[current_heavy]
		self.play()
	if mood == 1:
#		current_heavy = heavy1_sounds[randi() % heavy1_sounds.size()]
		current_heavy = randi() % heavy1_sounds.size()
		if current_heavy == last_heavy:
			current_heavy += 1
			if current_heavy > heavy1_sounds.size():
				current_heavy = 0
		self.stream = heavy1_sounds[current_heavy]
		self.play()
	if mood == 2:
#		current_heavy = heavy2_sounds[randi() % heavy2_sounds.size()]
		current_heavy = randi() % heavy2_sounds.size()
		if current_heavy == last_heavy:
			current_heavy += 1
			if current_heavy > heavy2_sounds.size():
				current_heavy = 0
		self.stream = heavy2_sounds[current_heavy]
		self.play()
	#if mood == 3:
	
	if str(current_heavy).length() < 2:
		emit_signal("soundEmitted", "4"+ str(mood) + "0" + str(current_heavy))
	else:
		emit_signal("soundEmitted", "4" + str(mood) + str(current_heavy))
	
	print("current heavy: ", current_heavy)
#	print("last heavy: ", last_heavy)
	last_heavy = current_heavy

func _on_engi_button_play_sound(mood):
	var engi0_sounds = Globals.engi0_sounds
	var engi1_sounds = Globals.engi1_sounds
	var engi2_sounds = Globals.engi2_sounds
	if mood == 0:
		current_engi = engi0_sounds[randi() % engi0_sounds.size()]
		current_engi = randi() % engi0_sounds.size()
		if current_engi == last_engi:
			current_engi += 1
			if current_engi > engi0_sounds.size():
				current_engi = 0
		self.stream = engi0_sounds[current_engi]
		self.play()
	if mood == 1:
		current_engi = engi1_sounds[randi() % engi1_sounds.size()]
		current_engi = randi() % engi1_sounds.size()
		if current_engi == last_engi:
			current_engi += 1
			if current_engi > engi1_sounds.size():
				current_engi = 0
		self.stream = engi1_sounds[current_engi]
		self.play()
	if mood == 2:
		current_engi = engi2_sounds[randi() % engi2_sounds.size()]
		current_engi = randi() % engi2_sounds.size()
		if current_engi == last_engi:
			current_engi += 1
			if current_engi > engi2_sounds.size():
				current_engi = 0
		self.stream = engi2_sounds[current_engi]
		self.play()
	#if mood == 3:
	
	if str(current_engi).length() < 2:
		emit_signal("soundEmitted", "5"+ str(mood) + "0" + str(current_engi))
	else:
		emit_signal("soundEmitted", "5" + str(mood) + str(current_engi))
	
	print("current engi: ", current_engi)
#	print("last engi: ", last_engi)
	last_engi = current_engi

func _on_medic_button_play_sound(mood):
	var medic0_sounds = Globals.medic0_sounds
	var medic1_sounds = Globals.medic1_sounds
	var medic2_sounds = Globals.medic2_sounds
	if mood == 0:
		current_medic = medic0_sounds[randi() % medic0_sounds.size()]
		current_medic = randi() % medic0_sounds.size()
		if current_medic == last_medic:
			current_medic += 1
			if current_medic > medic0_sounds.size():
				current_medic = 0
		self.stream = medic0_sounds[current_medic]
		self.play()
	if mood == 1:
		current_medic = medic1_sounds[randi() % medic1_sounds.size()]
		current_medic = randi() % medic1_sounds.size()
		if current_medic == last_medic:
			current_medic += 1
			if current_medic > medic1_sounds.size():
				current_medic = 0
		self.stream = medic1_sounds[current_medic]
		self.play()
	if mood == 2:
		current_medic = medic2_sounds[randi() % medic2_sounds.size()]
		current_medic = randi() % medic2_sounds.size()
		if current_medic == last_medic:
			current_medic += 1
			if current_medic > medic2_sounds.size():
				current_medic = 0
		self.stream = medic2_sounds[current_medic]
		self.play()
	#if mood == 3:
	
	if str(current_medic).length() < 2:
		emit_signal("soundEmitted", "6"+ str(mood) + "0" + str(current_medic))
	else:
		emit_signal("soundEmitted", "6" + str(mood) + str(current_medic))
	
	print("current medic: ", current_medic)
#	print("last medic: ", last_medic)
	last_medic = current_medic

func _on_sniper_button_play_sound(mood):
	var sniper0_sounds = Globals.sniper0_sounds
	var sniper1_sounds = Globals.sniper1_sounds
	var sniper2_sounds = Globals.sniper2_sounds
	if mood == 0:
		#current_sniper = sniper0_sounds[randi() % sniper0_sounds.size()]
		current_sniper = randi() % sniper0_sounds.size()
		if current_sniper == last_sniper:
			current_sniper = (current_sniper + 1) % sniper0_sounds.size()
			if current_sniper > sniper0_sounds.size():
				current_sniper = 0
		self.stream = sniper0_sounds[current_sniper]
		self.play()
	if mood == 1:
		#current_sniper = sniper1_sounds[randi() % sniper1_sounds.size()]
		current_sniper = randi() % sniper1_sounds.size()
		if current_sniper == last_sniper:
			current_sniper = (current_sniper + 1) % sniper1_sounds.size()
			if current_sniper > sniper1_sounds.size():
				current_sniper = 0
		print("current sniper exists: ", sniper1_sounds[current_sniper])
		self.stream = sniper1_sounds[current_sniper]
		self.play()
	if mood == 2:
		#current_sniper = sniper2_sounds[randi() % sniper2_sounds.size()]
		current_sniper = randi() % sniper2_sounds.size()
		if current_sniper == last_sniper:
			current_sniper = (current_sniper + 1) % sniper2_sounds.size()
			if current_sniper > sniper2_sounds.size():
				current_sniper = 0
		self.stream = sniper2_sounds[current_sniper]
		self.play()
	#if mood == 3:
	
	if str(current_sniper).length() < 2:
		emit_signal("soundEmitted", "7"+ str(mood) + "0" + str(current_sniper))
	else:
		emit_signal("soundEmitted", "7" + str(mood) + str(current_sniper))
	
#	print("current sniper: ", current_sniper)
#	print("last sniper: ", last_sniper)
	last_sniper = current_sniper

func _on_spy_button_play_sound(mood):
	var spy0_sounds = Globals.spy0_sounds
	var spy1_sounds = Globals.spy1_sounds
	var spy2_sounds = Globals.spy2_sounds
	if mood == 0:
		current_spy = spy0_sounds[randi() % spy0_sounds.size()]
		current_spy = randi() % spy0_sounds.size()
		if current_spy == last_spy:
			current_spy += 1
			if current_spy > spy0_sounds.size():
				current_spy = 0
		self.stream = spy0_sounds[current_spy]
		self.play()
	if mood == 1:
		current_spy = spy1_sounds[randi() % spy1_sounds.size()]
		current_spy = randi() % spy1_sounds.size()
		if current_spy == last_spy:
			current_spy += 1
			if current_spy > spy1_sounds.size():
				current_spy = 0
		self.stream = spy1_sounds[current_spy]
		self.play()
	if mood == 2:
		current_spy = spy2_sounds[randi() % spy2_sounds.size()]
		current_spy = randi() % spy2_sounds.size()
		if current_spy == last_spy:
			current_spy += 1
			if current_spy > spy2_sounds.size():
				current_spy = 0
		self.stream = spy2_sounds[current_spy]
		self.play()
	#if mood == 3:
	
	if str(current_spy).length() < 2:
		emit_signal("soundEmitted", "8" + str(mood) + "0" + str(current_spy))
	else:
		emit_signal("soundEmitted", "8" + str(mood) + str(current_spy))
	
	print("current spy: ", current_spy)
#	print("last spy: ", last_spy)
	last_spy = current_spy

