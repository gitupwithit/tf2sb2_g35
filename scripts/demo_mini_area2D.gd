extends Area2D

signal demo_collided_with_fog

func _on_demo_mini_area2D_area_entered(area):
	print("name of collision: ",area.get_name())
	if area.get_name()[1] == "f":
		emit_signal("demo_collided_with_fog")
