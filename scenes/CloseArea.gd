extends Area3D

func _on_area_entered(area):
	
	if area.collision_layer == 4:
		print("close!")

	else:
		return 
