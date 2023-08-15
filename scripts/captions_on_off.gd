extends Button

func _on_captions_pressed():
	if get_node("RichTextLabel_cap").text == "captions on":
		get_node("RichTextLabel_cap").text = "captions off"
		Globals.captions = false
	else:
		get_node("RichTextLabel_cap").text = "captions on"
		Globals.captions = true
