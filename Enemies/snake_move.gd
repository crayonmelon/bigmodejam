extends Path3D

func _process(delta):
	
	for i in get_child_count():
		get_child(i-1).progress  +=  (2 * i) * delta
