extends Button

var anim
var frame
var sprite
var mood
var old_mood = 0

signal play_sound
signal choose_anim
signal fade_out
signal demo_happy
signal demo_sad

func _ready():
	sprite = get_node("demo_animated_sprite")
	anim = get_node("demo_animated_sprite").get_animation()
	frame = get_node("demo_animated_sprite").get_frame()
	frame = 0
	anim = 01
	
	if Globals.demo_mg_score == 2:
		pass
#		sprite.play("happy")

func _on_Main_demo_mood(mood):
#	print("current anim = ", anim)
#	print("old mood = ", old_mood)
#	print("new mood = ", mood)
	if get_node("demo_animated_sprite").is_playing() == true:
		print("currently playing, exiting")
		pass
	if mood == 0:
		if old_mood == 0:
			pass
		if old_mood == 1:
			sprite.play("10")
		if old_mood == 2:
			sprite.play("20")
	if mood == 1:
		if old_mood == 0:
			sprite.play("01")
		if old_mood == 1:
			pass
		if old_mood == 2:
			sprite.play("21")
	if mood == 2:
		if old_mood == 0:
			sprite.play("02")
		if old_mood == 1:
			sprite.play("12")
		if old_mood == 2:
			pass
	if mood == 3:
		if old_mood == 0:
			sprite.play("03")
		if old_mood == 1:
			sprite.play("13")
		if old_mood == 2:
			sprite.play("23")
		if old_mood == 3:
			pass
	emit_signal("play_sound", mood)
	old_mood = mood

var previous_anim
var previous_frame = 0
func _on_demo_mg_timer_timeout():
	if Globals.demo_mg_score < 1:
		pass
	else:
	#	print("timer done, new time is ", get_node("timer/demo_mg_timer").wait_time)
		
		previous_frame = frame
		print("1 ", Globals.demo_mg_score, " 2 ", sprite.get_animation())
		if Globals.demo_mg_score == 1 && sprite.get_animation() != "sad":
			get_node("demo_mg_timer").wait_time = 60 + randi() % 20
	#		print("playing sad")
			previous_anim = anim
			sprite.play("sad")
			emit_signal("demo_sad")
			return
		if Globals.demo_mg_score == 2 && sprite.get_animation() != "happy":
			get_node("demo_mg_timer").wait_time = 60 + randi() % 20
			
			previous_anim = anim
			sprite.play("happy")
			emit_signal("demo_happy")
			return
		else:
			
	#		print("timer done, new time is ", get_node("timer/demo_mg_timer").wait_time)
			if previous_anim == null:
				previous_anim = 1
			if previous_anim == 1:
				sprite.play("01")
				sprite.stop()
				sprite.frame = previous_frame
			if previous_anim == 2:
				sprite.play("02")
				sprite.stop()
				sprite.frame = previous_frame
			if previous_anim == 3:
				sprite.play("12")
				sprite.stop()
				sprite.frame = previous_frame
			#get_node("timer/demo_mg_timer").wait_time = 1

func _on_demo_button_pressed():
	print("anim = ", sprite.get_animation())
	if Globals.demo_mg_score < 1:
		pass
	else:
		if sprite.get_animation() == "sad":
			Globals.last_pressed = 3
			print("switch to demo minigame")
			emit_signal("fade_out")
		if sprite.get_animation() == "happy":
			Globals.last_pressed = 3
			print("switch to demo minigame 4")
			emit_signal("fade_out")
		else:
			emit_signal("choose_anim")

