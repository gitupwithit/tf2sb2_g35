extends Sprite

signal demo_move
signal step

var x_coord

func _ready():
	self.visible = true

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if get_node("demo_mini_area2D").monitorable == false:
				print("monitoring on")
				get_node("demo_mini_area2D").monitorable = true				
			var distance = event.position - self.position
			if distance.x > 66:
				self.position.x += 66
			if distance.y > 66:
				self.position.y += 66
			if distance.x < -66:
				self.position.x -= 66
			if distance.y < -66:
				self.position.y -= 66
			if (distance.x <= 66 && distance.x > 0 && distance.y <= 66 && distance.y > 0) or (distance.x >= -66 && distance.x < 0 && distance.y >= -66 && distance.y < 0):
				self.position = event.position
			x_coord = self.position.x
			emit_signal("demo_move", x_coord)
			emit_signal("step")

