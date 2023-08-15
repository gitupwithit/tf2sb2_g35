extends Area2D

signal play_link_sound

func _on_glitch_area2D_area_entered(area):

	if Globals.demo_mg_score > 1:
		emit_signal("play_link_sound")
		OS.shell_open("https://en.wikipedia.org/wiki/Rick_May")
