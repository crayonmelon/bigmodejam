extends Area3D

func _on_area_entered(area):
	
	if area.collision_layer == 2:
		GameManager._chainge_health_val(-1)
	elif area.collision_layer == 4:
		GameManager._chainge_coin_val(1)
	else:
		return 
		
	area.queue_free()

