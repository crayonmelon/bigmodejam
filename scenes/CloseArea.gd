extends Area3D

func _on_area_entered(area):
	
	if area.collision_layer == 4:
		GameManager._chainge_coin_val(1)
		area.queue_free()

	elif area.collision_layer == 2:
		print("points")

	else:
		return 
