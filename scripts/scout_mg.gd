extends Spatial

var anim_blender
var awake = false
var monitor = false
var rung = false
var current_state = "sleep_loop"
var flipcount = 0

func _ready():
	$AnimationTree.set("parameters/sleep-lounge-read/blend_amount", -1)
	$AnimationTree.set("parameters/lounge-holdphone-hangup/blend_amount", 0)
	$scoutqc_skeleton/Skeleton/comic_hand.visible = false
	$scoutqc_skeleton/Skeleton/Handset_scout.visible = false

func _on_anim_timer_timeout():
	print("timer timeout, state is ", current_state)
	if current_state == "sleep_loop":
		current_state = "wake_up"
		print("should wake up")
		$AnimationTree.set("parameters/wakeup_trigger/active", true)
	elif current_state == "wake_up":
		$AnimationTree.set("parameters/wakeup_trigger/active", true)
	elif current_state == "lounge_loop":
		print("should grab phone")
		$AnimationTree.set("parameters/reach_for_phone_trigger/active", true)
		current_state = "on_phone"
	elif current_state == "on_phone":
		print("should hang up now")
		$AnimationTree.set("parameters/lounge-holdphone-hangup/blend_amount", 1)
		$AnimationTree.set("parameters/hang_up_trigger/active", true)
		print($AnimationTree.get("parameters/lounge-holdphone-hangup/blend_amount"), " ", $AnimationTree.get("parameters/reach_for_phone_trigger/active"), " " , $AnimationTree.get("parameters/sleep-lounge-read/blend_amount"))
	elif current_state == "read":
		if flipcount > 2:
			$AnimationTree.set("parameters/throw_away_trigger/active",true)
			flipcount = 0
		else:
			flipcount += 1
			$AnimationTree.set("parameters/page_flip_trigger/active", true)

func wake_up_complete():
	print("wake up complete")
	current_state = "lounge_loop"

func comic_toss_complete():
	print("louge_loop status now")
	current_state = "lounge_loop"

func hang_up_complete():
	print("hand up complete lounge loop status")
	current_state = "lounge_loop"

func ring_phone():
	if rung == false:
		rung = true
		get_node("phone_ring").play()
		get_node("CanvasLayer/scout_mg_hud/audio_icon").visible = false

func _on_phone_ring_finished():
	if awake == false:
		awake = true
		$scout_mg_anims.play("wake_up")

