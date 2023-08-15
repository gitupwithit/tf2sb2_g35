extends Button

func _on_Descriptions_pressed():
	if get_node("RichTextLabel_desc").text == "descriptions on":
		get_node("RichTextLabel_desc").text = "descriptions off"
		Globals.descriptions = false
	else:
		get_node("RichTextLabel_desc").text = "descriptions on"
		Globals.descriptions = true
