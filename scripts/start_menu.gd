extends Control

var json_string

func _ready():
	align_menu_text()
	load_game()

func align_menu_text():
	var desc_size = get_node("CanvasLayer/TextureRect/Descriptions").rect_size
	var caps_size = get_node("CanvasLayer/TextureRect/captions").rect_size 
	var contact_size = get_node("CanvasLayer/TextureRect/contact").rect_size
	var start_size = get_node("CanvasLayer/TextureRect/start").rect_size
	get_node("CanvasLayer/TextureRect/Descriptions/RichTextLabel_desc").rect_position.x = (desc_size.x / 2) - (get_node("CanvasLayer/TextureRect/Descriptions/RichTextLabel_desc").rect_size.x /2)
	get_node("CanvasLayer/TextureRect/Descriptions/RichTextLabel_desc").rect_position.y = (desc_size.y / 2) - (get_node("CanvasLayer/TextureRect/Descriptions/RichTextLabel_desc").rect_size.y /2)
	get_node("CanvasLayer/TextureRect/captions/RichTextLabel_cap").rect_position.x = (caps_size.x / 2) - (get_node("CanvasLayer/TextureRect/captions/RichTextLabel_cap").rect_size.x /2)
	get_node("CanvasLayer/TextureRect/captions/RichTextLabel_cap").rect_position.y = (caps_size.y / 2) - (get_node("CanvasLayer/TextureRect/captions/RichTextLabel_cap").rect_size.y /2)
	get_node("CanvasLayer/TextureRect/contact/RichTextLabel_contact").rect_position.x = (contact_size.x /2) - (get_node("CanvasLayer/TextureRect/contact/RichTextLabel_contact").rect_size.x /2)
	get_node("CanvasLayer/TextureRect/contact/RichTextLabel_contact").rect_position.y = (contact_size.y /2) - (get_node("CanvasLayer/TextureRect/contact/RichTextLabel_contact").rect_size.y /2)
	get_node("CanvasLayer/TextureRect/start/RichTextLabel_start").rect_position.x = (start_size.x / 2) - (get_node("CanvasLayer/TextureRect/start/RichTextLabel_start").rect_size.x /2)
	get_node("CanvasLayer/TextureRect/start/RichTextLabel_start").rect_position.y = (start_size.y / 2) - (get_node("CanvasLayer/TextureRect/start/RichTextLabel_start").rect_size.y /2)

func create_player_data_file(): # 0 = unnavailable, 1 = available, 2 = complete
	var save_dict = {
		"scout_mg" : 1,
		"soldier_mg" : 0,
		"pyro_mg" : 0,
		"demo_mg" : 0,
		"heavy_mg" : 0,
		"engi_mg" : 0,
		"medic_mg" : 0,
		"sniper_mg" : 0,
		"spy_mg" : 0
	}
	json_string = to_json(save_dict)
	
	var file = File.new()
	var error = file.open("user://playerdata.dat", File.WRITE)
	if error != OK:
		print("Error opening file for writing: ", error)
		return
	print("JSON string: ", json_string)
	file.store_string(json_string)
	file.close()

func load_game():
	print("data location: ", OS.get_user_data_dir())
	var file_load = File.new()
	if file_load.file_exists("user://playerdata.dat") == false:
		print("no playerdata file found")
		create_player_data_file()
		print("Creating player data file...")
		print(json_string)
	else:
		print("player data found")
		file_load.open("user://playerdata.dat", File.READ)
		var json_string = file_load.get_as_text()
#		print("Read player data: ", json_string)
		file_load.close()
		var loaded_data = JSON.parse(json_string).result
		Globals.scout_mg_score = loaded_data["scout_mg"]
		Globals.soldier_mg_score = loaded_data["soldier_mg"]
		Globals.pyro_mg_score = loaded_data["pyro_mg"]
		Globals.demo_mg_score = loaded_data["demo_mg"]
		Globals.heavy_mg_score = loaded_data["heavy_mg"]
		Globals.engi_mg_score = loaded_data["engi_mg"]
		Globals.medic_mg_score = loaded_data["medic_mg"]
		Globals.sniper_mg_score = loaded_data["sniper_mg"]
		Globals.spy_mg_score = loaded_data["spy_mg"]
		print(Globals.scout_mg_score,Globals.soldier_mg_score,Globals.pyro_mg_score,Globals.demo_mg_score,Globals.heavy_mg_score,Globals.engi_mg_score,Globals.medic_mg_score,Globals.sniper_mg_score,Globals.spy_mg_score)

func _on_AudioStreamPlayer_door_finished():
	get_tree().change_scene("res://scenes/loading_screen_2.tscn")
