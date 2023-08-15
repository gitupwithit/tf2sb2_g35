extends Button

var anim
var frame
var sprite
var old_mood = 0

signal play_sound

func _ready():
	sprite = get_node("heavy_animated_sprite")
	anim = get_node("heavy_animated_sprite").animation
	frame = get_node("heavy_animated_sprite").frame
	frame = 0
	anim = "01"

func _on_Main_heavy_mood(mood):
	print("current anim = ", anim)
	print("old mood = ", old_mood)
	print("new mood = ", mood)
	if get_node("heavy_animated_sprite").is_playing() == true:
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
#	if mood == 3:
#		if old_mood == 0:
#			sprite.play("03")
#		if old_mood == 1:
#			sprite.play("13")
#		if old_mood == 2:
#			sprite.play("23")
#		if old_mood == 3:
#			pass
	emit_signal("play_sound", mood)
	print("heavy play sound signal emitted")
	old_mood = mood

