# scout mg logic

extends Spatial

var anim_blender
var awake = false
var monitor = false
var rung = false
var current_scout_anim = ""

func _ready():
	anim_blender = $scout_mg_anims/animation_blender
	Globals.checkvars()
	var fade_in_node = load("res://scenes/fade_in_scene.tscn")
	var fade_in_node_instance = fade_in_node.instance()
	fade_in_node_instance.name = "fade_in_node_instance"
	self.add_child(fade_in_node_instance)
	Globals.game_state = "scout_mini_game"
	get_node("scoutqc_skeleton/Handset_chair").visible = true
	get_node("scoutqc_skeleton/Skeleton/Handset_scout").visible = false
	get_node("comic_armature/Skeleton2/comic").visible = false
	lounge_loop()
	current_scout_anim = "lounge"
	$scout_mg_anims/scout_anims_timer.start(5)
	

func _on_scout_anims_timer_timeout():
	print("scout animation timer event")
	scout_animation_control()
	
func set_looping(animation_name: String, looping: bool):
	var animation = $scout_mg_anims.get_animation(animation_name)
	if animation:
		animation.loop = looping

func blend_anims(initial_anim, new_anim, time):
	$scout_mg_anims.stop()
	$scout_mg_anims.seek(0)
	$scout_mg_anims.play("grab_comic")
	set_looping("grab_comic", false)
	var initial_pos = -1
	var target_pos = 1
	var animation_tree = $scout_mg_anims/animation_blender
	var tween = $Tween
	animation_tree.set("parameters/BlendSpace1D/blend_position", initial_pos)
	tween.interpolate_property(animation_tree, "parameters/BlendSpace1D/blend_position", initial_pos, target_pos, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

	tween.start()

	
#	if blend_space == null:
#		print("BlendSpace1D not found!")
#		return
	
func scout_animation_control():
	if current_scout_anim == "sleep":
		pass
	if current_scout_anim == "lounge":
		var initial_anim = "lounge"
		var new_anim = "grab_comic"
		var time = .5
		blend_anims(initial_anim,new_anim,time)
		

func _on_scout_mg_timer_timeout():
	var from = "scout_mg"
	var to = "main"
	Globals.fade_out_scene(from, to)

func reset_anim_plr():
	$scout_mg_anims.playback_speed = 1

# sleep loop
func sleep_loop():
	$scout_mg_anims.play("sleep_anim")

# ring phone
func ring_phone():
	if rung == false:
		rung = true
		get_node("phone_ring").play()
		get_node("CanvasLayer/scout_mg_hud/audio_icon").visible = false

# wake up
func _on_phone_ring_finished():
	if awake == false:
		awake = true
		$scout_mg_anims.play("wake_up")

# slow down x2:
func slow_down_x2():
	$scout_mg_anims.playback_speed = .5

# slow down x3:
func slow_down_x3():
	$scout_mg_anims.playback_speed = .33

# get phone
func get_phone():
	$scout_mg_anims.playback_speed = 1
	$scout_mg_anims.play("reach_for_phone")
#	$anim_timer.start(3) # testing only with no mic access

func turn_on_mic():
	monitor = true
	get_node("CanvasLayer").get_node("scout_mg_hud").get_node("audio_icon").visible = true

# reply
func _on_anim_timer_timeout():
	$scout_mg_anims.play("vo_uh_no")
	get_node("CanvasLayer").get_node("scout_mg_hud").get_node("audio_icon").visible = false

# hang up
func hang_up():
	$scout_mg_anims.play("hang_up")
	$scout_mg_timer.start(3)

# lounge loop
func lounge_loop():
	$scout_mg_anims.play("lounge_loop")

# monitor mic
func _process(_delta):
	pass
#	if monitor == true: # uncomment when mic is accessable
#		var power = AudioServer.get_bus_peak_volume_right_db(AudioServer.get_bus_index("Record"), 0)
#		print(power)
#		var percent = power / -200
#		get_node("CanvasLayer").get_node("scout_mg_hud").get_node("audio_icon").modulate.r = percent
#		if power > -25:
#			get_node("CanvasLayer").get_node("scout_mg_hud").get_node("audio_icon").modulate.r = 1
#			$anim_timer.start(3)
#			monitor = false
