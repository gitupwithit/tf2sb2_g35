extends Spatial

var anim_blender
var awake = false
var monitor = false
var phone_answered = false
var rung = false
var current_state = "sleep_loop"
var flipcount = 0
var hud_scene

func _ready():
	$AnimationTree.set("parameters/sleep-lounge-read/blend_amount", -1)
	$AnimationTree.set("parameters/lounge-holdphone-hangup/blend_amount", 0)
	$scoutqc_skeleton/Handset_chair.visible = true
	$scoutqc_skeleton/Skeleton/comic_hand.visible = false
	$scoutqc_skeleton/Skeleton/Handset_scout.visible = false
	if get_node("CanvasLayer").get_node("scout_mg_hud"):
		hud_scene = get_node("CanvasLayer").get_node("scout_mg_hud")

func _on_lounge_state_timer_timeout():
	print("timer timeout, state is ", current_state)
	if current_state == "answering_phone":
		pass
	if current_state == "sleep_loop":
		pass
	elif current_state == "wake_up":
		$AnimationTree.set("parameters/reach_for_phone_trigger/active", true)
		pass
	elif current_state == "lounge_loop":
		$AnimationTree.set("parameters/sleep-lounge-read/blend_amount",.01)
		$AnimationTree.set("parameters/grab_comic_trigger/active", true)
		pass
	elif current_state == "on_phone":
		pass

func _on_page_flip_timer_timeout():
	if current_state == "reading":
		print("flip count = ", flipcount)
		if flipcount > 5:
			$AnimationTree.set("parameters/throw_away_trigger/active",true)
			flipcount = 0
			
		else:
			flipcount += 1
			$AnimationTree.set("parameters/page_flip_trigger/active", true)

func reset_phone():
	hud_scene.get_node("phone_button").visible = true

func wake_up_complete():
	print("wake up complete")
	current_state = "answering_phone"
	print("should grab phone")
	$AnimationTree.set("parameters/reach_for_phone_trigger/active", true)
	
func phone_grab_complete():
	print("change status to on_phone")
	current_state = "on_phone"
	print("timer timeout, state is ", current_state)

func reply():
	$AnimationTree.set("parameters/vo_uh_no_trigger/active", true)

func stop_ring():
	$phone_ring.stop()	

func show_audio_meter():
	hud_scene.get_node("audio_icon").visible = true

func hang_up():
	print("should hang up now")
	$AnimationTree.set("parameters/hang_up_trigger/active", true)
	current_state = "hanging_up"
	print("timer timeout, state is ", current_state)

func comic_toss_complete():
	print("lounge_loop status now")
	current_state = "lounge_loop"
	$AnimationTree.set("parameters/throw_away_trigger/active", false)

func hang_up_complete():
	print("hang up complete lounge loop status")
	current_state = "lounge_loop"
	rung = false

func ring_phone():
	if rung == false:
		rung = true
		get_node("phone_ring").play()
		get_node("CanvasLayer/scout_mg_hud/phone_button").visible = false


func _on_phone_ring_finished():
	if awake == false:
		$phone_ring/phone_ring_timer.start()
		awake = true
		current_state = "wake_up"
		print("should wake up")
		$AnimationTree.set("parameters/wakeup_trigger/active", true)
	elif current_state == "reading":
		$AnimationTree.set("parameters/throw_away_trigger/active", true)

func _on_phone_ring_timer_timeout():
	if phone_answered == false:
		get_node("phone_ring").play()

func grab_comic_complete():
	current_state = "reading"
	$scout_mg_anims/page_flip_timer.start(3)
	reset_phone()

# monitor mic
func _process(_delta):
	hud_scene.get_node("timer_label").bbcode_text = str($lounge_state_timer.get_time_left())
	pass
	if monitor == true: # uncomment when mic is accessable
		var power = AudioServer.get_bus_peak_volume_right_db(AudioServer.get_bus_index("Record"), 0)
		print(power)
		var percent = power / -200
		hud_scene.get_node("audio_icon").modulate.r = percent
		if power > -25:
			hud_scene.get_node("audio_icon").modulate.r = 1
			$mic/mic_timer.start(3)
			monitor = false

func _on_mic_timer_timeout():
	hud_scene.get_node("audio_icon").visible = false
	$AnimationTree.set("parameters/vo_uh_no_trigger/active", true)
	current_state = "talking"

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_SPACE:
			if current_state == "lounge_loop" || \
			current_state == "sleep_loop" || \
			current_state == "reading":
				ring_phone()
		if event.scancode == KEY_V:
			if current_state == "on_phone":
				$mic/mic_timer.start(3)

