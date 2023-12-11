extends Area3D

func _on_area_entered(area):
	if GameManager.is_3D_mode:
		area.queue_free()
