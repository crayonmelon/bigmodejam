extends PathFollow3D

@export var Speed = 10

func _process(delta):
	progress = progress + Speed * delta
