extends TextureRect

var bg_image

func _ready():
	if Globals.demo_mg_score > 1:
		var bg_pics = ["res://images/demo_mg_4_bgs/demo_soldier.PNG",
		"res://images/demo_mg_4_bgs/demo_soldier_2.PNG",
		"res://images/demo_mg_4_bgs/demo_soldier_3.PNG",
		"res://images/demo_mg_4_bgs/soldier_desk_2.PNG",
		"res://images/demo_mg_4_bgs/soldier_desk_3.PNG",
		"res://images/demo_mg_4_bgs/soldier_desk_4.jpg",
		"res://images/demo_mg_4_bgs/soldier_desk_4.PNG"
		]
		self.texture = load(bg_pics[randi() % bg_pics.size()])

